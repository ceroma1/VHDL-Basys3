library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (7 downto 0));
end Contador;

architecture Behavioral of Contador is

signal cuenta: unsigned(7 downto 0):= (others =>'0');

begin
	process(clk,reset)
		begin
		if reset = '1' then
		  cuenta <= (others =>'0');
		elsif clk' event and clk ='1' then
		  if ce='1' then
		      cuenta <= (cuenta + 1);
		  end if;
		end if; 
	end process;
	FoutCuenta<=std_logic_vector(cuenta);
end Behavioral;
