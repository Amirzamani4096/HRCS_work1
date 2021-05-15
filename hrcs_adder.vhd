library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity hrcs_adder is
generic( 
   n : integer :=2 ;
   k : integer :=2
);
port ( 
   x : in  unsigned(n*k-1 downto 0);
   y : in  unsigned(n*k-1 downto 0);
   cin : in unsigned(n-1 downto 0) := (others => '0');
   s : out unsigned(n*k-1 downto 0);
   c : out std_logic_vector(n-1 downto 0)
);
end hrcs_adder;
architecture arch of hrcs_adder is
begin
    process(x,y,cin)
    variable t : unsigned(k downto 0);
    variable tt : unsigned(k-1 downto 0) := (others => '0');
    begin
   main_loop : for i in 0 to n-1 loop
                    t                         :=  ('0' & x( (i+1)*k-1 downto i*k )) + ('0' & y( (i+1)*k-1 downto i*k )) + (tt & cin(i));
                    s( (i+1)*k-1 downto i*k ) <= t( k-1 downto 0 );
                    c(i)                      <= t( k );
               end loop;
    end process;
end arch;