library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity ce_gen is
  generic (
      constant DIV_FACT : POSITIVE := 10
  );
  port (
    clk   : IN STD_LOGIC;
    srst  : IN STD_LOGIC;
    ce_in : IN STD_LOGIC;
    ce_out  : OUT STD_LOGIC
  ) ;
end ce_gen;

architecture Behavioral of ce_gen is

    signal clk_sig   : POSITIVE range 1 to DIV_FACT + 1 := 1;

begin
    clk_divider : process(clk)
    begin
        if rising_edge(clk) then
            if srst = '1' then
                clk_sig <= 1;
                ce_out <= '0';
            elsif ce_in = '1' then
                clk_sig <= clk_sig + 1;
                ce_out <= '0';
                if clk_sig = DIV_FACT then
                    ce_out <= '1';
                    clk_sig <= 1;
                end if;
            end if;
        end if;
    end process ; -- identifier
end architecture Behavioral ; -- arch