----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY rp_top IS
  PORT (
    clk             : IN  STD_LOGIC;
    BTN             : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    SW              : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    LED             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_SEG        : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    DISP_DIG        : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    uart_txd_out    : OUT STD_LOGIC
  );
END rp_top;
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF rp_top IS
----------------------------------------------------------------------------------

  COMPONENT seg_disp_driver
  PORT (
    clk             : IN  STD_LOGIC;
    dig_1_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_2_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_3_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_4_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dp_i            : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);        -- [DP4 DP3 DP2 DP1]
    dots_i          : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);        -- [L3 L2 L1]
    disp_seg_o      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_dig_o      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
  END COMPONENT;

  COMPONENT UART_Tx_block
  PORT(
    clk                 : IN  STD_LOGIC;
    UART_Tx_start       : IN  STD_LOGIC;
    UART_clk_EN         : IN  STD_LOGIC;
    UART_Data_in        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    UART_Tx_busy        : OUT STD_LOGIC;
    UART_Tx_Data_out    : OUT STD_LOGIC
  );
  END COMPONENT;
  COMPONENT ce_gen
  GENERIC(
    DIV_FACT : positive := 2
  );
  PORT (
    clk  : in  std_logic;               -- clock signal
    srst : in  std_logic;               -- synchronous reset
    ce   : in  std_logic;               -- input clock enable
    ce_o : out std_logic                -- clock enable output (always one clock long)
    );
  END COMPONENT;
  
  COMPONENT btn_in
  GENERIC(
    DEB_PERIOD                  : POSITIVE := 3
  );
  PORT(
    clk                         : IN  STD_LOGIC;
    ce                          : IN  STD_LOGIC;
    btn                         : IN  STD_LOGIC;
    btn_debounced               : OUT STD_LOGIC;
    btn_edge_pos                : OUT STD_LOGIC;
    btn_edge_neg                : OUT STD_LOGIC;
    btn_edge_any                : OUT STD_LOGIC
  );
  END COMPONENT;
  --------------------------------------------------------------------------------
  SIGNAL clk_en           : STD_LOGIC := '0';
  SIGNAL btn_edge_pos_sig : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL UART_Data_in_sig : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  --------------------------------------------------------------------------------
  --
  --       DIG 1       DIG 2       DIG 3       DIG 4
  --                                       L3
  --       -----       -----       -----   o   -----
  --      |     |     |     |  L1 |     |     |     |
  --      |     |     |     |  o  |     |     |     |
  --       -----       -----       -----       -----
  --      |     |     |     |  o  |     |     |     |
  --      |     |     |     |  L2 |     |     |     |
  --       -----  o    -----  o    -----  o    -----  o
  --             DP1         DP2         DP3         DP4
  --
  --------------------------------------------------------------------------------

  seg_disp_driver_i : seg_disp_driver
  PORT MAP (
    clk                 => clk,
    dig_1_i             => "0000",
    dig_2_i             => "0000",
    dig_3_i             => "0000",
    dig_4_i             => "0000",
    dp_i                => "0000",
    dots_i              => "000",
    disp_seg_o          => DISP_SEG,
    disp_dig_o          => DISP_DIG
  );

  --------------------------------------------------------------------------------
  UART_Tx_block_i : UART_Tx_block
  PORT MAP(
    clk                 => clk,
    UART_Tx_start       => btn_edge_pos_sig(0),
    UART_clk_EN         => clk_en,
    UART_Data_in        => UART_Data_in_sig,
    UART_Tx_busy        => led(4),
    UART_Tx_Data_out    => uart_txd_out
  );
  
  ce_gen_i : ce_gen
  GENERIC MAP(
    DIV_FACT => 434
  )
  PORT MAP(
    clk                => clk,
    srst               => '0',
    ce                 => '1',
    ce_o               => clk_en
  );
  
  
  
    -- button input module
  gen_btn_in : FOR i IN 0 TO 3 GENERATE
  btn_in_inst : btn_in
  GENERIC MAP(
      DEB_PERIOD => 5
      )
      PORT MAP(
          clk => clk, 
		  ce => clk_en, 
		  btn => BTN(i),
		  btn_edge_pos => btn_edge_pos_sig(i)
 	   );
  END GENERATE gen_btn_in;
  
  
  UART_Data_in_sig(0) <= SW(0);
  UART_Data_in_sig(1) <= SW(1);
  UART_Data_in_sig(2) <= SW(2);
  UART_Data_in_sig(3) <= SW(3);

----------------------------------------------------------------------------------
END Structural;
----------------------------------------------------------------------------------
