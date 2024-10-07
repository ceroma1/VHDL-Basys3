library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

component Contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (7 downto 0));
end component;

--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal ce : std_logic := '1';

--Outputs
signal FoutCuenta : STD_LOGIC_VECTOR (7 downto 0);

-- Clock period definitions
constant clk_period : time := 10 ns;
   
begin

-- Instantiate the Unit Under Test (UUT)
   uut: Contador PORT MAP (
          clk => clk,
          reset => reset,
          ce=>ce,
          FoutCuenta => FoutCuenta
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
S_reset:PROCESS
BEGIN
reset<= '1';
WAIT FOR 6ns;
reset<= '0';
wait;
end process;

S_ce:PROCESS
BEGIN
ce<= '1';
WAIT FOR 60 ns;
ce<= '0';
wait for 40 ns;
end process;

end Behavioral;
