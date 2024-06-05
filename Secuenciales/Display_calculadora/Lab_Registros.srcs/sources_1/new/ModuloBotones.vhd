library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ModuloBotones is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           anodos : out  STD_LOGIC_VECTOR (3 downto 0));
end ModuloBotones;

architecture Behavioral of ModuloBotones is

begin

process(sel)
	begin
		case sel is
			when "00" =>anodos<="1110";
			when "01" =>anodos<="1101";
			when "10" =>anodos<="1011";
			when "11" =>anodos<="0111";
			when others =>anodos<="ZZZZ";
		end case;
	end process;
end Behavioral;
