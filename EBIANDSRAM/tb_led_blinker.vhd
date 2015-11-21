LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_led_blinker IS
END tb_led_blinker;
 
ARCHITECTURE behavior OF tb_led_blinker IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT led_blinker
    PORT(
         clk : IN  std_logic;
         led : OUT  std_logic;
         pattern : IN  std_logic_vector(31 downto 0);
         pattern_wen : IN  boolean
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pattern : std_logic_vector(31 downto 0) := (others => '0');
   signal pattern_wen : boolean := false;

 	--Outputs
   signal led : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: led_blinker PORT MAP (
          clk => clk,
          led => led,
          pattern => pattern,
          pattern_wen => pattern_wen
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for clk_period;

		pattern <= x"0000FFFF";
		pattern_wen <= true;
		wait for clk_period;
		pattern_wen <= false;
		
		assert led = '0' severity failure;
		
		wait for 33554431*clk_period;
		assert led = '0' severity failure;
		wait for clk_period;
		assert led = '1' severity failure;

      report "Test success" severity failure;
   end process;

END;
