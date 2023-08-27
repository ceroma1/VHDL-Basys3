library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;

entity BinarioBCD_V2 is
    Port ( DatoIn : in STD_LOGIC_VECTOR (13 downto 0);
           DatoOut : out STD_LOGIC_VECTOR (15 downto 0));
end BinarioBCD_V2;

architecture Behavioral of BinarioBCD_V2 is

begin
process(DatoIn)  
    variable z:STD_LOGIC_VECTOR(29 downto 0);
	begin
	   for i in 0 to 29 loop
	       z(i):='0';
	   end loop;
	   z(16 downto 3):=DatoIn;
	   for i in 0 to 10 loop
        if z(17 downto 14) > 4 then
		  z(17 downto 14):=z(17 downto 14)+3;
		end if;
		if z(21 downto 18) > 4 then
		  z(21 downto 18):=z(21 downto 18)+3;
		end if;
		if z(25 downto 22) > 4 then
		  z(25 downto 22):=z(25 downto 22)+3;
		end if;
	z(29 downto 1):=z(28 downto 0);
	end loop;
	DatoOut<=z(29 downto 14);
end process;
end Behavioral;
