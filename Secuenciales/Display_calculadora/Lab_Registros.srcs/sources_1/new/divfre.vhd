library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;

entity divfre is
    Port ( clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           clk190 : out  STD_LOGIC);
end divfre;

architecture Behavioral of divfre is

-- Para calcular cuenta y fincuenta se parte de:
-- reloj de la nexys  100MHZ => periodo 1/100MHZ =10ns
-- fincuenta = tiempo del alto/20ns ejemplo fincuenta= 0.5seg/10ns=50000000
-- fincuenta = (1/1000)/20ns = 50000
-- cuenta = log(fincuenta)/log(2) ejemplo cuenta= log(50000000)/log(2)= 25.575 se aproxima a 26
-- cuenta = 15.60
-- OJO dise�e este divisor para una frecuencia de 500Hz
 
signal cuenta : natural range 0 to 2**16-1;
constant fincuenta : natural := 50000;
signal unseg : std_logic;
signal aux : std_logic;

begin 

	Process (clear,clk)
  
begin
	if clear = '1' then
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
Process (clear, clk)
begin
	if clear = '1' then
		aux <= '0';
	elsif clk'event and clk='1' then
		if unseg = '1' then
			aux <= not aux;
		end if;
	end if;
end process;

clk190 <= aux;

end Behavioral;
