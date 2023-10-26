library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Presenta is
    Port ( DatoEntrada : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           anodo : out STD_LOGIC_VECTOR (3 downto 0));
end Presenta;

architecture Behavioral of Presenta is

component Bin_BCD is
    Port ( DatoIn : in STD_LOGIC_VECTOR (7 downto 0);
           DatoOut : out STD_LOGIC_VECTOR (9 downto 0));
end component;

component Cuenta1 is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux4a1 is
    Port ( DatoInA : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInB : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInC : in STD_LOGIC_VECTOR (3 downto 0);
               sel : in STD_LOGIC_VECTOR (2 downto 0);
           FoutDato : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component negacion is
    Port ( btn : in STD_LOGIC_VECTOR (2 downto 0);
           anodo : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ModuloDisplay is
    Port ( DatoIn : in STD_LOGIC_VECTOR (3 downto 0);
           segmento : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component divide1 is
    Port ( clk : in STD_LOGIC;
           FoutDivide : out STD_LOGIC);
end component;

signal sg1:STD_LOGIC_VECTOR (9 downto 0);
signal sg2:STD_LOGIC_VECTOR (2 downto 0);
signal sg3:STD_LOGIC_VECTOR (3 downto 0);
signal sg4:STD_LOGIC;

begin

u0:Bin_BCD port map(DatoIn=>DatoEntrada,DatoOut=>sg1);
u1:Mux4a1 port map(DatoInA=>sg1(3 downto 0),DatoInB=>sg1(7 downto 4),DatoInC(3 downto 2)=>"00",DatoInC(1 downto 0)=>sg1(9 downto 8),sel=>sg2,FoutDato=>sg3);
u2:ModuloDisplay port map(DatoIn=>sg3,segmento=>segmento);
u3:cuenta1 port map(clk=>sg4,clear=>reset,FoutCuenta=>sg2);
u4:negacion port map(btn=>sg2,anodo=>anodo);
u5:divide1 port map(clk=>clk,Foutdivide=>sg4);


end Behavioral;
