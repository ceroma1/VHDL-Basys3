library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Divisor is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutDivide : out STD_LOGIC);
end Divisor;

architecture Behavioral of Divisor is

-- Para calcular cuenta y fincuenta se parte de:
-- reloj de la basys 3  100MHZ => periodo 1/100MHZ =10ns
-- fincuenta = tiempo del alto/10ns ejemplo fincuenta= 0.5seg/10ns=50000000
-- cuenta = log(fincuenta)/log(2) ejemplo cuenta= log(50000000)/log(2)= 25.575 se aproxima a 26

signal cuenta : natural range 0 to 2**26-1;
constant fincuenta : natural := 50000000;
signal unseg : std_logic;
signal aux : std_logic;

begin 

	Process (reset,clk)
  
begin
	if reset = '1' then
		cuenta <= 0;
		unseg <= '0';
	elsif clk'event and clk = '1' then
		if cuenta = fincuenta-1 then -- aqui se pone la constante en vez de 49999999
			cuenta <= 0;
			unseg <= '1';
		else
			cuenta <= cuenta + 1;
			unseg <= '0';
		end if;
	end if;
end process;

--flip flop
Process (reset, clk)
begin
	if reset = '1' then
		aux <= '0';
	elsif clk'event and clk='1' then
		if unseg = '1' then
			aux <= not aux;
		end if;
	end if;
end process;
Foutdivide <= aux;
end Behavioral;
