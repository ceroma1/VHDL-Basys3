library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupContador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           up_dow : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (3 downto 0));
end SupContador;

architecture Behavioral of SupContador is

component Divisor is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutDivide : out STD_LOGIC);
end component;

component contadorupdow is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (3 downto 0);
           up_dow : in  STD_LOGIC);
end component;

signal sg_clk: Std_logic;

begin

uo:Divisor Port map(clk=>clk,reset=>reset,Foutdivide=>sg_clk);
u1:contadorupdow Port map(clk=>sg_clk,reset=>reset,led=>FoutCuenta,up_dow=>up_dow);
end Behavioral;
