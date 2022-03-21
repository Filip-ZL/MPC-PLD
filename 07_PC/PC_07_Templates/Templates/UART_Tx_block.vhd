----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY UART_Tx_block IS
  PORT(
    clk                 : IN  STD_LOGIC;
    UART_Tx_start       : IN  STD_LOGIC;
    UART_clk_EN         : IN  STD_LOGIC;
    UART_Data_in        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    UART_Tx_busy        : OUT STD_LOGIC;
    UART_Tx_Data_out    : OUT STD_LOGIC
  );
END UART_Tx_block;
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF UART_Tx_block IS
----------------------------------------------------------------------------------
SIGNAL UART_Data_in_reg     : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
SIGNAL UART_tx_busy_reg     : STD_LOGIC := '0';
SIGNAL UART_Tx_Data_out_reg : STD_LOGIC := '0';
SIGNAL bits_cnt             : INTEGER RANGE 0 TO 9 := 0;
SIGNAL tx_done              : BOOLEAN := False;
----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------
PROCESS(clk) IS
BEGIN
    IF rising_edge(clk) THEN
        IF (UART_Tx_start = '1') AND (UART_Tx_busy_reg = '0') THEN
            UART_Data_in_reg <= '0' & UART_Data_in & '1';
            UART_Tx_busy_reg <= '1';
        ELSIF tx_done THEN
            UART_Tx_busy_reg <= '0';
        END IF;
        UART_Tx_Data_out <= UART_Tx_Data_out_reg;
        UART_Tx_busy <= UART_Tx_busy_reg;
    END IF;
END PROCESS;

shift_register: PROCESS(UART_clk_EN) IS
BEGIN
    IF (UART_clk_EN = '1') AND (UART_Tx_busy_reg = '1') THEN
        tx_done <= False;
        IF bits_cnt = 9 THEN
            bits_cnt <= 0;
            tx_done <= True;
        ELSE
            UART_Tx_Data_out_reg <= UART_Data_in_reg(bits_cnt);
            bits_cnt <= bits_cnt + 1;
        END IF;       
    END IF;
END PROCESS;

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------
