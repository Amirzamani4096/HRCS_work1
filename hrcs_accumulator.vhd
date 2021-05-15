library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity hrcs_accumulator is
generic( 
   n : integer :=2 ;
   k : integer :=4
);
port ( 
   x    : in  unsigned(n*k-1 downto 0);
   clk  : in std_logic;
   init : in std_logic;
   rst  : in std_logic;
   sum  : out unsigned(n*k-1 downto 0);
   c    : out std_logic_vector(n-1 downto 0)
);
end hrcs_accumulator;
architecture arch of hrcs_accumulator is
begin
    process(clk)
        variable sum1 :  unsigned(k downto 0)    := (others => '0');
        variable sum2 :  unsigned(k downto 0)    := (others => '0');
        --variable tt   : unsigned(k downto 0)     := (others => '0');
        variable t    : unsigned(k-1 downto 0)   := (others => '0');
        variable flag : boolean                  := False;
    begin
        main_loop : for i in 0 to n-1 loop
                loop_2 : for j in 0 to k-1 loop
                            if (clk'event and clk='1') and rst='0' then
                                if init='1' then
                                    if flag=True then
                                        sum1 :=  (others => '0');
                                        flag :=   False;
                                    end if;
                                    sum2                      :=  t & x(i*n+j);
                                    sum1                      :=  sum1 + (t & x(i*n+j));
                                    sum((i+1)*k-1 downto i*k) <=  sum2(k-1 downto 0);
                                else
                                    sum1                      :=  sum1 + (t & x(i*n+j));
                                    sum((i+1)*k-1 downto i*k) <=  sum1(k-1 downto 0);
                                    flag                      :=  True;
                                end if;
                             end if;
                          end loop;
                            if flag=False then
                                c(i) <= sum2(k);
                            else
                                c(i) <= sum1(k);
                            end if;
                     end loop;
      end process;
end arch;