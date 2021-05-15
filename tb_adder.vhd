library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

  entity tb_adder IS
  generic( 
     n : integer := 2;
     k : integer :=2
  );
  end tb_adder;
  
  architecture behavior of tb_adder is
          signal x,y,s :  unsigned(n*k-1 downto 0) := (others => '0');
          signal c :  std_logic_vector(n-1 downto 0) := (others => '0');
  begin
    UUT : entity work.hrcs_adder port map(x => x ,y => y ,s => s ,c => c );

     tb1 : process
     begin
            wait for 2 ns;
             x  <=  "0011";
             y  <=  "1100";
             
            wait for 2 ns;
            x   <=  "1101";
            y   <=  "1011";
            
            wait for 2 ns;
            x   <=  "1010";
            y   <=  "0111";

     end process tb1;

  end;