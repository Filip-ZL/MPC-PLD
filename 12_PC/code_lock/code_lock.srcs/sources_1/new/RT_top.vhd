----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY rp_top IS
  PORT(
    clk             : IN  STD_LOGIC;
    btn_i           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    sw_i            : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    led_o           : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_seg_o      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_dig_o      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END rp_top;
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF rp_top IS
----------------------------------------------------------------------------------
  COMPONENT seg_disp_driver
  PORT(
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
  END COMPONENT seg_disp_driver;
  
  COMPONENT ce_gen
  GENERIC (
    DIV_FACT                    : POSITIVE := 2       -- clock division factor
  );
  PORT (
    CLK                         : IN  STD_LOGIC;      -- clock signal
    SRST                        : IN  STD_LOGIC;      -- synchronous reset
    CE_IN                       : IN  STD_LOGIC;      -- input clock enable
    CE_OUT                      : OUT STD_LOGIC       -- clock enable output
  );
  END COMPONENT ce_gen;
  
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
  COMPONENT FSM
  PORT(
      clk         : IN std_logic;
      btn_1       : IN std_logic;
      btn_2       : IN std_logic;
      btn_3       : IN std_logic;
      btn_4       : IN std_logic;
      cnt         : IN std_logic;
      led_o       : OUT std_logic_vector(7 DOWNTO 0);
      pswd_done   : OUT std_logic;
      cnt_rst     : OUT std_logic
  );
  END COMPONENT;
  ------------------------------------------------------------------------------
  SIGNAL stopw_sig          : STD_LOGIC;
  SIGNAL cnt_sig            : STD_LOGIC;
  SIGNAL cnt_0_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_1_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_2_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_3_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL btn_edge_pos_sig   : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL led_o_sig          : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL pswd_done_sig      : STD_LOGIC;
  SIGNAL disp_EN_sig        : STD_LOGIC;
  SIGNAL cnt_rst_sig        : STD_LOGIC;
----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  --------------------------------------------------------------------------------
  -- display driver
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
  PORT MAP(
    clk                 => clk,
    dig_1_i             => "0000",
    dig_2_i             => "0000",
    dig_3_i             => "0000",
    dig_4_i             => led_o_sig(7 DOWNTO 4),
    dp_i                => "0000",
    dots_i              => "011",
    disp_seg_o          => disp_seg_o,
    disp_dig_o          => disp_dig_o
  );
  --------------------------------------------------------------------------------
  -- clock enable generator
  ce_gen_i : ce_gen
  GENERIC MAP(
    DIV_FACT                    => 500000
  )
  PORT MAP(
    CLK                         => clk,
    SRST                        => '0',
    CE_IN                       => '1',
    CE_OUT                      => stopw_sig
  );
  
  
  --------------------------------------------------------------------------------
  -- button input module
  gen_btn_in : FOR i IN 0 TO 3 GENERATE
  btn_in_inst : btn_in
  GENERIC MAP(
      DEB_PERIOD => 5
      )
      PORT MAP(
          clk => clk, 
		  ce => stopw_sig, 
		  btn => btn_i(i),
		  btn_edge_pos => btn_edge_pos_sig(i)
 	   );
  END GENERATE gen_btn_in;

  --------------------------------------------------------------------------------
  -- stopwatch control FSM
  ce_gen_2 : ce_gen
  GENERIC MAP(
    DIV_FACT                    => 100000000
  )
  PORT MAP(
    CLK                         => clk,
    SRST                        => cnt_rst_sig,
    CE_IN                       => '1',
    CE_OUT                      => cnt_sig
  );
  FSM_i : FSM
  PORT MAP(
    clk => clk,
    btn_1     => btn_edge_pos_sig(0),
    btn_2     => btn_edge_pos_sig(1),
    btn_3     => btn_edge_pos_sig(2),
    btn_4     => btn_edge_pos_sig(3),
    cnt       => cnt_sig,
    pswd_done => pswd_done_sig,
    cnt_rst   => cnt_rst_sig,
    led_o     => led_o_sig
  );
  led_o <= pswd_done_sig & "000" & led_o_sig(3 DOWNTO 0);

----------------------------------------------------------------------------------
END Structural;
----------------------------------------------------------------------------------