library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Camvolution is
	generic (
		IMAGE_WIDTH : integer := 640;
		IMAGE_HEIGHT : integer := 480
	);
	port (
		sys_clk : in std_logic;
	--	led : out std_logic;
		sw6, sw7 : in std_logic;
		
		-- HDMI
		RX0_TMDS : in std_logic_vector(3 downto 0);
		RX0_TMDSB : in std_logic_vector(3 downto 0);
		TX0_TMDS : out std_logic_vector(3 downto 0);
		TX0_TMDSB : out std_logic_vector(3 downto 0);
		
		RSTBTN : in std_logic;
		
		sram1_address : out std_logic_vector(18 downto 0);
		sram1_data : inout std_logic_vector(15 downto 0);
		sram1_ce, sram1_oe, sram1_lb, sram1_ub, sram1_we : out std_logic;
		
		sram2_address : out std_logic_vector(18 downto 0);
		sram2_data : inout std_logic_vector(15 downto 0);
		sram2_ce, sram2_oe, sram2_lb, sram2_ub, sram2_we : out std_logic;

		ebi_wen, ebi_ren, ebi_cs0, ebi_cs1 : in std_logic;
		ebi_address : in std_logic_vector(19 downto 0);
		ebi_data : inout std_logic_vector(15 downto 0)
	);
end Camvolution;

architecture Behavioral of Camvolution is
	
	
	signal efm_mode : boolean;
	
	-- FIFO 16 bit
	signal fifo_ebi_valid : std_logic;
	signal fifo_ebi_ready : std_logic;
	
	-- Clock for HDMI module
	signal sysclk : std_logic;
	
	-- Clock stuff
	signal bufio2_to_bufg_clock : std_logic;
	signal bufio2_sample_clock : std_logic;
	
	
	-- Memory manager clk
	signal memory_clk : std_logic;
	signal memoryclk : std_logic;
	
	-- EBI signals
	signal ebi_data_sync : std_logic_vector(15 downto 0);
	signal ebi_empty_sync : std_logic;
	
	-- TEMP HDMI signals
	
	signal SW : std_logic_vector(3 downto 0);
	

	
	signal hdmi_data, pixel_data : std_logic_vector(23 downto 0);
	signal hdmi_ready, hdmi_valid, pixel_clk, pixel_ready : std_logic := '0';
	
	
	component IBUF
		port (O: out STD_ULOGIC;
				I: in STD_ULOGIC);
	end component;
	
	component BUFIO2 
	generic(
		DIVIDE_BYPASS : boolean := FALSE;  -- TRUE, FALSE
		DIVIDE        : integer := 3;     -- {1..8}
		I_INVERT      : boolean := FALSE; -- TRUE, FALSE
		USE_DOUBLER   : boolean := FALSE  -- TRUE, FALSE
	);
	port(
		DIVCLK       : out std_ulogic;
		IOCLK        : out std_ulogic;
		SERDESSTROBE : out std_ulogic;
		I            : in  std_ulogic
	);
	end component;
	
	component IBUFG
	port (
		O : out std_ulogic;
		I : in  std_ulogic
	);
	end component;
	
begin
	
   generate_sysclk : IBUF
      port map (
						O => sysclk,
					   I => sys_clk
						);

	i_bufio2 : BUFIO2
		generic map
		(
			DIVIDE			=> 3,		-- Do not divide the clock
			DIVIDE_BYPASS	=> FALSE,	-- Bypass the clock divider
			I_INVERT		=> FALSE,	-- Do not invert clock
			USE_DOUBLER		=> FALSE	-- Do not double the clock
		)
		port map
		(
			DIVCLK			=> memoryclk,-- This clock must be transmitted to a BUFG
			IOCLK			=> bufio2_sample_clock,	-- This clock must be used to sample datas on the IOBUF2
			SERDESSTROBE	=> open,				-- Unused
			I				=> sysclk			-- This is the external clock for inputs
		);
		
--	memory_clk_bufg : IBUFG
--	port map(
--		O => memory_clk,
--		I => memoryclk
--	);
	

	-- Constant values for memory
	sram1_lb <= '0';
	sram1_ub <= '0';
	sram2_lb <= '0';
	sram2_ub <= '0';
	
	memory_manager : entity work.memory_manager
		generic map (
			IMAGE_WIDTH => IMAGE_WIDTH,
			IMAGE_HEIGHT => IMAGE_HEIGHT
		)
		port map (
			clk => sysclk,
			reset => false,
			efm_mode => efm_mode,
			ebi_address => ebi_address(18 downto 0),
			ebi_data => ebi_data,
			ebi_wen => ebi_wen,
			ebi_ren => ebi_ren,
			ebi_cs => ebi_cs0,
			daisy_data => x"0000",
			daisy_valid => '0',
			hdmi_ready => hdmi_ready,
			hdmi_data => hdmi_data,
			hdmi_valid => hdmi_valid,
			sram1_address => sram1_address,
			sram1_data => sram1_data,
			sram1_ce => sram1_ce,
			sram1_oe => sram1_oe,
			sram1_we => sram1_we,
			sram2_address => sram2_address,
			sram2_data => sram2_data,
			sram2_ce => sram2_ce,
			sram2_oe => sram2_oe,
			sram2_we => sram2_we
		);

	hdmi : entity work.hdmi
	port map (
	--	RSTBTN => RSTBTN,
		clk120 => sysclk,
		RX0_TMDS => RX0_TMDS, 
		RX0_TMDSB => RX0_TMDSB,
		TX0_TMDS => TX0_TMDS,
		TX0_TMDSB => TX0_TMDSB
		
		--pclk => pixel_clk,
		--pdata => pixel_data,
		--pready => pixel_ready

	);
	
	fifo_ebi : entity work.fifo_16bit
		port map (	
			wr_clk => ebi_wen,
			rd_clk => sysclk,	-- Probably more like "daisy_clk"...
			din => ebi_data,
			wr_en => '1',
			rd_en => fifo_ebi_ready,
			dout => ebi_data_sync,
			empty => ebi_empty_sync
		);
	
--	fifo_hdmi : entity work.fifo_24bit
--		port map (
--			wr_clk => memory_clk,
--			rd_clk => pixel_clk,
--			din => hdmi_data,
--			wr_en => hdmi_valid,
--			rd_en => pixel_ready,
--			dout => pixel_data,
--			full => hdmi_ready
--		);
	
--	ram_clk_divider : entity work.ram_clk_divider
--	port map (
--		clk_in1 => sysclk,
--		clk_out1 => memory_clk
--	);
	
	fifo_ebi_valid <= not ebi_empty_sync;

	ebi_manager : entity work.ebi_manager
	port map (
		clk => sysclk,
		ebi_address => ebi_address(1 downto 0),
		ebi_cs => ebi_cs0,
		ebi_data => ebi_data,
		fifo_valid => fifo_ebi_valid,
		fifo_ready => fifo_ebi_ready,
		daisy_reset => open,
		efm_mode => efm_mode,
		control_valid => open,
		control_data => open
	);
	

end Behavioral;

