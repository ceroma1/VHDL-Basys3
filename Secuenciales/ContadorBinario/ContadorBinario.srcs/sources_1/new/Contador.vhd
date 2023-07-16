library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;

entity Contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (7 downto 0));
end Contador;

architecture Behavioral of Contador is

signal cuenta:STD_LOGIC_VECTOR (7 downto 0);

begin
	process(clk,reset)
		begin
		if reset = '1' then
		cuenta <= (others =>'0');
		elsif clk' event and clk ='1' then
		cuenta <= (cuenta + 1);
		end if; 
	end process;
	FoutCuenta<=cuenta;
end Behavioral;
