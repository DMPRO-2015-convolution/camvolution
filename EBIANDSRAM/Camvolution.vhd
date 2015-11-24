library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Camvolution is
	generic (
		IMAGE_WIDTH : integer := 640;
		IMAGE_HEIGHT : integer := 480
	);
	port (
		clk120 : in std_logic;
		led : out std_logic;
		sw6, sw7 : in std_logic;
		
		-- HDMI
		RX0_TMDS : in std_logic_vector(3 downto 0);
		RX0_TMDSB : in std_logic_vector(3 downto 0);
		TX0_TMDS : out std_logic_vector(3 downto 0);
		TX0_TMDSB : out std_logic_vector(3 downto 0);
		RSTBTN_n : in std_logic;
		--received_pixel : buffer std_logic_vector(23 downto 0);
		--processed_pixel : buffer std_logic_vector(23 downto 0);
		
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
	-- Daisy stuff
	signal io_control_data_in : std_logic_vector(23 downto 0) :=(others => '1');
   signal io_control_input_valid : std_logic := '1';
   signal io_hdmi_input_valid : std_logic := '1';
   signal io_reset : std_logic := '0';
   signal io_output_ready : std_logic := '1';
   signal io_output_valid : std_logic := '1';
	signal io_request_processed_data : std_logic := '1';
   signal io_dbg_rdy_for_output : std_logic := '0';
   signal io_dbg_rdy_for_input : std_logic := '0';
	
	signal clk25, clk40, clk40_pre : std_logic;
	
	signal pixel_from_hdmi : std_logic_vector(23 downto 0) :=(others => '0');
	signal pixel_from_daisy : std_logic_vector(23 downto 0) :=(others => '0');
	signal efm_mode : boolean;
	
	-- FIFO 16 bit
	signal fifo_ebi_valid : std_logic;
	signal fifo_ebi_ready : std_logic;
	
	signal metadata_in : std_logic_vector(2 downto 0) :=(others => '0');
	signal metadata_out : std_logic_vector(2 downto 0) :=(others => '0');

	
	signal io_enable_in :std_logic := '1';
	signal io_stall : std_logic := '0';
	signal pixelclock : std_logic;
	signal pixel_clk : std_logic;
	signal ioclk : std_logic;
	signal serdesstrobe : std_logic;
	
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
	

	
	signal hdmi_data, pixel_data : std_logic_vector(23 downto 0);
	signal hdmi_ready, hdmi_valid, pixel_ready : std_logic := '0';
	

	signal tx0_pclk : std_logic;
	signal received_pixel, processed_pixel, daisy_out : std_logic_vector(23 downto 0);
	
	component IBUF
		port (O: out STD_ULOGIC;
				I: in STD_ULOGIC);
	end component;
	
	component BUFG
		port (O: out STD_ULOGIC;
				I: in STD_ULOGIC);
	end component;
	
	component BUFIO2 
	generic(
		DIVIDE_BYPASS : boolean := TRUE;  -- TRUE, FALSE
		DIVIDE        : integer := 1;     -- {1..8}
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
	
	component DCM_CLKGEN
	generic( 
		CLKFX_MULTIPLY : integer := 5;
		CLKF_DIVIDE : integer := 24
		);
	port (
		CLKIN : in std_ulogic;
		CLKFX : out std_ulogic
	);
	end component;
	
	
	component IBUFG
	port (
		O : out std_ulogic;
		I : in  std_ulogic
	);
	end component;
	component sender
	port (
	clk : in std_logic;
	received_pixel : in std_logic_vector(23 downto 0);
	processed_pixel : out std_logic_vector(23 downto 0)
	);
	end component;
	
	component Tile
	port (
	clk : in std_logic; 
	reset : in std_logic;
   io_hdmi_data_in : inout std_logic_vector(23 downto 0);
   io_data_out : out std_logic_vector(23 downto 0)
 
);
end component;

begin


clk25_generate : DCM_CLKGEN
port map(
		CLKIN => clk120,
		CLKFX => clk25
	);

clk40_generate : BUFIO2
generic map(
	DIVIDE_BYPASS => false,
	DIVIDE => 3
)
port map(
		I => clk120,
		DIVCLK => clk40_pre
	);

clk40_bufg : BUFG
port map(
	I => clk40_pre,
	O => clk40
);

--pixelclock_generator : BUFIO2
--	port map(
--		DIVCLK     => divclk,
--		IOCLK      => ioclk,
--		SERDESSTROBE => serdesstrobe,
--		I            => clk120
--		);
		
--pixel_bufg : BUFG
--	port map(
--		O => pixel_clk,
--		I => pixelclock
--	);
	
	
		
daisy :  Tile
	port map(
	clk => tx0_pclk, 
	reset => io_reset,
	io_hdmi_data_in => received_pixel,
	io_data_out => daisy_out
);

	efm_mode <= false; -- TODO: Connect ebi manager
	led <= '0';
	processed_pixel <= pixel_data when efm_mode else daisy_out;
	
	-- Constant values for memory
	sram1_lb <= '0';
	sram1_ub <= '0';
	sram2_lb <= '0';
	sram2_ub <= '0';
	
	-- Handles reading and writing to SRAM
	memory_manager : entity work.memory_manager
		generic map (
			IMAGE_WIDTH => IMAGE_WIDTH,
			IMAGE_HEIGHT => IMAGE_HEIGHT
		)
		port map (
			clk => tx0_pclk,
			reset => false,
			efm_mode => true,
			ebi_address => ebi_address(18 downto 0),
			ebi_data => ebi_data,
			ebi_wen => ebi_wen,
			ebi_ren => ebi_ren,
			ebi_cs => ebi_cs0,
			daisy_data => x"0000",
			daisy_valid => '0',
			hdmi_ready => '1',
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
		RSTBTN_n => RSTBTN_n,
		clk25 => clk25,
		RX0_TMDS => RX0_TMDS, 
		RX0_TMDSB => RX0_TMDSB,
		TX0_TMDS => TX0_TMDS,
		TX0_TMDSB => TX0_TMDSB,
		tx0_pclk => tx0_pclk,
		received_pixel => received_pixel,
		processed_pixel => processed_pixel
	);
	
--	fifo_ebi : entity work.fifo_16bit
--		port map (	
--			wr_clk => ebi_wen,
--			rd_clk => sysclk,	-- Probably more like "daisy_clk"...
--			din => ebi_data,
--			wr_en => '1',
--			rd_en => fifo_ebi_ready,
--			dout => ebi_data_sync,
--			empty => ebi_empty_sync
--		);
	
	fifo_hdmi : entity work.fifo_24bit
		port map (
			wr_clk => clk40,
			rd_clk => tx0_pclk,
			din => hdmi_data,
			wr_en => hdmi_valid,
			rd_en => '1',
			dout => pixel_data
		);
	
	--ram_clk_divider : entity work.ram_clk_divider
	--port map (
	--	clk_in1 => clk120,
	--	clk_out1 => memory_clk
	--);
	
	fifo_ebi_valid <= not ebi_empty_sync;

--	ebi_manager : entity work.ebi_manager
--	port map (
--		clk => sysclk,
--		ebi_address => ebi_address(1 downto 0),
--		ebi_cs => ebi_cs0,
--		ebi_data => ebi_data,
--		fifo_valid => fifo_ebi_valid,
--		fifo_ready => fifo_ebi_ready,
--		daisy_reset => open,
--		efm_mode => efm_mode,
--		control_valid => open,
--		control_data => open
--	);
	

end Behavioral;

