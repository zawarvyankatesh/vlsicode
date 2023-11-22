LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY USR4_tb IS
END USR4_tb;
 
ARCHITECTURE USR4_tb_arch OF USR4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT USR4
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         mode : IN  std_logic_vector(1 downto 0);
         Sin : IN  std_logic;
         Pin : IN  std_logic_vector(3 downto 0);
         Sout : OUT  std_logic;
         Pout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '1';
   signal mode : std_logic_vector(1 downto 0) := (others => '0');
   signal Sin : std_logic := '0';
   signal Pin : std_logic_vector(3 downto 0) := "1010";

 	--Outputs
   signal Sout : std_logic;
   signal Pout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: USR4 PORT MAP (
          rst => rst,
          clk => clk,
          mode => mode,
          Sin => Sin,
          Pin => Pin,
          Sout => Sout,
          Pout => Pout
        );

   -- Clock process definitions
   clk_process :process
   begin

		clk<=NOT(clk);
		wait for clk_period/2 ;
   end process;
 

   -- Stimulus process
   stim_proc_mode: process
   begin		
     mode<="00";
	  wait for 80 ns;
	  
	  mode<="01";
	  wait for 50 ns;
	  
	  mode<="10";
	  wait for 50 ns;
	  
	  mode<="11";
	  wait for 20 ns;
   end process;



	stim_proc_Sin:process
	begin
	wait for 10 ns;
	
	Sin<='1';
	wait for 10 ns;
	
	Sin<='0';
	wait for 10 ns;
	
	Sin<='1';
	wait for 10 ns;
	
	Sin<='0';
	wait for 10 ns;
	
	Sin<= '0';
	wait for 40 ns;
	
	Sin<='1';
	wait for 10 ns;
	
	Sin<='0';
	wait for 10 ns;
	
	Sin<='1';
	wait for 10 ns;
	
	Sin<='0';
	wait for 10 ns;
	
	Sin<= '0';
	wait ;

	end process;
	
	
	stim_proc_rst:process
	begin
	rst<='0';
	wait for 300 ns;
	
	rst<='1';
	wait for 10 ns;
	end process;
END;
