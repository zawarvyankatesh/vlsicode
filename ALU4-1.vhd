library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           F : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           CARRY_SIGN : out  STD_LOGIC
			);
end ALU4;

architecture ALU4_arch of ALU4 is
	signal result: STD_LOGIC_VECTOR(4 DOWNTO 0):=(OTHERS=>'0');
	begin
		process(A,B,F)
		begin
			case F is
			
			-- 6 LOGICAL OPERATIONS , F="000" to F="101"
				when "000" =>
					result<= '0' & (A AND B);
				when "001" =>
					result<= '0' & (A NAND B);
				when "010" =>
					result<= '0' & (A OR B);
				when "011" =>
					result<= '0' & (A NOR B);
				when "100" =>
					result<= '0' & (A XOR B);
				when "101" =>
					result<= '0' & (A XNOR B);
					
					-- ADDITION , F="110"
				when "110" =>
					result<= ('0' & A)+('0' & B);
				when others =>
					IF A < B THEN
--						result <= '0' &(NOT B);
--						result<=result+1;
--						result <= ('0' & A) + result;
--						result <= (NOT result) + 1;
						result<= (NOT(('0' & A) + ('0' &(NOT B)) + 1))+1;
					ELSE
						result <= ('0' & A)-('0' & B);
					END IF;
			end case;
			
		end process;
	 
			Y <= result(3 downto 0);
			CARRY_SIGN <= result(4);
			
end ALU4_arch;

