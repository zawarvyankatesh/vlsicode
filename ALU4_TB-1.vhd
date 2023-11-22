LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
 
ENTITY ALU4_TB IS
END ALU4_TB;
 
ARCHITECTURE behavior OF ALU4_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU4
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         F : IN  std_logic_vector(2 downto 0);
         Y : OUT  std_logic_vector(3 downto 0);
         CARRY_SIGN : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := "0101";
   signal B : std_logic_vector(3 downto 0) := "1110";
   signal F : std_logic_vector(2 downto 0) := (others => '1');

 	--Outputs
   signal Y : std_logic_vector(3 downto 0);
   signal CARRY_SIGN : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU4 PORT MAP (
          A => A,
          B => B,
          F => F,
          Y => Y,
          CARRY_SIGN => CARRY_SIGN
        );


   -- Stimulus process
   stim_proc_F: process
   begin		
			F <= F + 1;
			wait for 100 ns;
   end process;
     

END;
