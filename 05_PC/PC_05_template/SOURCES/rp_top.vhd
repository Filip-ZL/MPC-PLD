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
    btn_ss      : IN std_logic;
    btn_lc      : IN std_logic;
    cnt_EN      : OUT std_logic;
    disp_EN     : OUT std_logic;
    cnt_rst     : OUT std_logic
  );
  END COMPONENT;
  
  COMPONENT stopwatch
  Port ( 
    clk : in STD_LOGIC;
    disp_enable : in STD_LOGIC;
    cnt_enable  : in STD_LOGIC;
    cnt_reset   : in STD_LOGIC;
    ce          : in STD_LOGIC;
    cnt_3       : out STD_LOGIC_VECTOR (3 downto 0);
    cnt_2       : out STD_LOGIC_VECTOR (3 downto 0);
    cnt_1       : out STD_LOGIC_VECTOR (3 downto 0);
    cnt_0       : out STD_LOGIC_VECTOR (3 downto 0));
  END component;
  ------------------------------------------------------------------------------
  SIGNAL stopw_sig          : STD_LOGIC;
  SIGNAL cnt_0_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_1_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_2_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_3_sig          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL btn_edge_pos_sig   : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL cnt_EN_sig         : STD_LOGIC;
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
    dig_1_i             => cnt_3_sig,
    dig_2_i             => cnt_2_sig,
    dig_3_i             => cnt_1_sig,
    dig_4_i             => cnt_0_sig,
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
  -- stopwatch module (4-decade BCD counter)
  stopwatch_i : stopwatch
  PORT MAP(
    clk         => clk,
    disp_enable => disp_EN_sig,
    cnt_enable  => cnt_EN_sig,
    cnt_reset   => cnt_rst_sig,
    ce          => stopw_sig,
    cnt_3       => cnt_3_sig,
    cnt_2       => cnt_2_sig,
    cnt_1       => cnt_1_sig,
    cnt_0       => cnt_0_sig
  );


  --------------------------------------------------------------------------------
  -- stopwatch control FSM
  FSM_i : FSM
  PORT MAP(
    clk => clk,
    btn_ss   => btn_edge_pos_sig(0),
    btn_lc   => btn_edge_pos_sig(3),
    cnt_EN   => cnt_EN_sig,
    disp_EN  => disp_EN_sig,
    cnt_rst  => cnt_rst_sig
  );


----------------------------------------------------------------------------------
END Structural;
----------------------------------------------------------------------------------
