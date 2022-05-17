----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY UART_Tx_block IS
  PORT(
    clk                 : IN  STD_LOGIC;
    Tx_start            : IN  STD_LOGIC;
    clk_en              : IN  STD_LOGIC;
    Data_in             : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
    Tx_Data_out         : OUT STD_LOGIC
  );
END UART_Tx_block;
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF UART_Tx_block IS
----------------------------------------------------------------------------------
SIGNAL UART_data_reg    : STD_LOGIC_VECTOR(33 DOWNTO 0) := (OTHERS => '0');
SIGNAL UART_Tx_busy_sig : BOOLEAN := FALSE;
SIGNAL Tx_enable        : BOOLEAN := FALSE;
SIGNAL bit_cnt          : NATURAL := 0;

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------
  PROCESS (clk) 
  BEGIN
    IF rising_edge(clk) THEN
    
      IF (Tx_start = '1' AND NOT(UART_Tx_busy_sig)) THEN
        UART_data_reg <= '1' & Data_in & '0';
        UART_Tx_busy_sig <= TRUE;
        Tx_enable <= TRUE;
      END IF;
      IF clk_en = '1' THEN
          IF Tx_enable THEN
            Tx_Data_out <= UART_data_reg(33 - bit_cnt);
            bit_cnt <= bit_cnt + 1;
      
            IF bit_cnt >= 33 THEN
              Tx_enable <= FALSE;
              UART_Tx_busy_sig <= FALSE;
              bit_cnt <= 0;
            END IF;
            
          END IF;
      END IF;  
    END IF;
  END PROCESS;

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------
