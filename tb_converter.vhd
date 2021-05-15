library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

  ENTITY tb_converter IS
  generic( 
     n : integer := 2;
     k : integer := 2
  );
  END tb_converter;

  ARCHITECTURE behavior OF tb_converter IS
          SIGNAL s,sum :  unsigned(n*k-1 downto 0):= (others => '0');
          SIGNAL c :  unsigned(n-1 downto 0);
  BEGIN
    UUT : entity work.hrcs_converter port map(s => s ,c => c ,sum => sum);

     tb1 : PROCESS
     BEGIN
            wait for 2 ns;
            s<="0101";
            c<="10";
            wait for 2 ns;
            s<="0111";
            c<="11";
            wait for 2 ns;
            s<="0110";
            c<="01";

--            wait for 2 ns;
--            sel <="01";
--            wait for 2 ns;
--            sel <="10";
--             wait for 2 ns;
--             sel <="11";
--              wait for 2 ns;
            --more input combinations can be given here.
     END PROCESS tb1;

  END;