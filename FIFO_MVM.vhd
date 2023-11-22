library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_4x8 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (1 downto 0) := "00";
           d_in : in  STD_LOGIC_VECTOR (7 downto 0);
           rd_wr : in  STD_LOGIC;
           d_out : out  STD_LOGIC_VECTOR (7 downto 0) := "00000000";
           empty : out  STD_LOGIC := '1';
           full : out  STD_LOGIC := '0');
end FIFO_4x8;

architecture FIFO_4x8_arch of FIFO_4x8 is

TYPE mem IS ARRAY(3 DOWNTO 0) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL memory : mem := (others=>(others=>'0'));

begin

    PROCESS(rst, clk, addr, d_in, rd_wr)

	 begin

	     if rst = '1' then
		      d_out <= "00000000";
				empty <= '1';
				full <= '0';
				memory <= (others=>(others=>'0'));

        elsif falling_edge(clk) then

            case rd_wr is

				    when '0' =>

					     d_out <= memory(conv_integer(addr));
						  empty <= '0';
				        full <= '1';

				    when others =>

					     memory(conv_integer(addr)) <= d_in;
						  empty <= '0';
						  if addr = "11" then
				            full <= '1';
						  else
				            full <= '0';
						  end if;
            end case;
        end if;
    end process;

end FIFO_4x8_arch;
