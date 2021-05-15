library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

  entity tb_accumulator IS
  generic( 
     n : integer := 2;
     k : integer :=4
  );
  end tb_accumulator;

  architecture behavior of tb_accumulator is
          signal x,sum :  unsigned(n*k-1 downto 0) := (others => '0');
          signal c :  std_logic_vector(n-1 downto 0) := (others => '0');
          signal clk, init, rst :  std_logic := '0';
          -- Clock period definitions
          constant clk_i_period : time := 1 ns;
  begin
    UUT : entity work.hrcs_accumulator port map(x => x,clk => clk, init => init, rst => rst, sum => sum ,c => c );
    
    -- Clock process definitions
       CLK_I_process :process
       begin
            clk <= '0';
            wait for clk_i_period/2;
            clk <= '1';
            wait for clk_i_period/2;
       end process;
       
     tb1 : process
     begin  
            x   <= "01110101";
          -- x <= "0111";
            
            init <= '1';
            
            wait for 2 ns;   
            init <= '0';
            
            wait for 2 ns; 
            init <= '1';
            
            wait for 1 ns; 
            init <= '0';
            
            wait;


     end process tb1;

  end;