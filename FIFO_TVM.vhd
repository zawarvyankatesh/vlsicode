LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
 
ENTITY FIFO_4x8_tb IS
END FIFO_4x8_tb;
 
ARCHITECTURE behavior OF FIFO_4x8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO_4x8
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         addr : IN  std_logic_vector(1 downto 0);
         d_in : IN  std_logic_vector(7 downto 0);
         rd_wr : IN  std_logic;
         d_out : OUT  std_logic_vector(7 downto 0);
         empty : OUT  std_logic;
         full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '1';
   signal addr : std_logic_vector(1 downto 0) := (others => '0');
   signal d_in : std_logic_vector(7 downto 0) := (others => '0');
   signal rd_wr : std_logic := '0';

 	--Outputs
   signal d_out : std_logic_vector(7 downto 0);
   signal empty : std_logic;
   signal full : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO_4x8 PORT MAP (
          rst => rst,
          clk => clk,
          addr => addr,
          d_in => d_in,
          rd_wr => rd_wr,
          d_out => d_out,
          empty => empty,
          full => full
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= not(clk);
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		
		
	
		rd_wr <= '1';
		for address in 0 to 3 loop
			addr <= std_logic_vector(to_unsigned(address, 2));
			d_in <= std_logic_vector(to_unsigned(63*(address + 1), 8));
			wait for clk_period*2;
		end loop;
		
		d_in <= std_logic_vector(to_unsigned(0, 8));
		
		rd_wr <= '0';
		for address in 0 to 3 loop
			addr <= std_logic_vector(to_unsigned(address, 2));
			wait for clk_period*2;
		end loop;
		
   end process;
	
	stim_proc_reset :PROCESS
	                 BEGIN
						  
						   wait for clk_period*12;
                     rst <= '1';
		               wait for clk_period*2;
		               rst <= '0';
		               wait ;
							
							end process;
													

END;
