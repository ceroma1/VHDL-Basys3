library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Maq_Estado is
    Port ( clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Int_ext : in STD_LOGIC;
           Foutq : out STD_LOGIC);
end Maq_Estado;

architecture Behavioral of Maq_Estado is

Type estados is (ocio,s0,s1,s2,s3);
signal estadoActual,estadoSiguiente:estados;

begin

FSM:process(clk,reset)
begin
	if reset ='1' then 
		estadoActual<=ocio;  --esdado de reseto estado ocioso
	elsif(clk'event and clk='1') then
		EstadoActual<=estadoSiguiente;
	end if;
end process;

siguiente: process(Int_ext,estadoActual)

begin
	case estadoActual Is
		when ocio=>
			if int_ext = '1' then
				estadoSiguiente<=s0;
			else
				estadoSiguiente<=ocio;
			end if;
		when s0 =>
			if int_ext ='0' then
				estadoSiguiente<=s1;
			else 
				estadoSiguiente<=s0;
			end if;
		when s1 =>
			if int_ext ='1' then
				estadoSiguiente<=s2;
			else
				estadoSiguiente<=s1;
		end if;
	when s2 =>
			if int_ext ='0' then
				estadoSiguiente<=s3;
			else
				estadoSiguiente<=s2;
			end if;
	when s3 =>
			estadoSiguiente<=ocio;
	end case;		
end process;
 
salidas:process(estadoActual)
begin
	case estadoActual Is
		when ocio => Foutq <= '0';
		when s0   => Foutq <= '0';
		when s1   => Foutq <= '0';
		when s2   => Foutq <= '0';
		when s3   => Foutq <= '1';
	end case;
end process;
end Behavioral;
