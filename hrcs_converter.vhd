library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity hrcs_converter is
generic( 
   n : integer :=2 ;
   k : integer :=2
);
port ( 
   s : in  unsigned(n*k-1 downto 0) := (others => '0');
   c : in  unsigned(n-1 downto 0) := (others => '0');
   sum : out unsigned(n*k-1 downto 0)
);
end hrcs_converter;
architecture arch of hrcs_converter is
begin
    process(s,c)
        variable t1 : unsigned(k-2 downto 0) := (others => '0');
        variable cc : unsigned(n downto 0);
    begin
        cc := c & '0';  
        main_loop : for i in 0 to n-1 loop
                         sum( (i+1)*k-1 downto i*k ) <= s( (i+1)*k-1 downto i*k ) + (t1 & cc(i));
                    end loop;
    end process;
end arch;