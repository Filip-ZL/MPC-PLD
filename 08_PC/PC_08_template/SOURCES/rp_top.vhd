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
    clk                 : IN  STD_LOGIC;
    dig_1_i             : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_2_i             : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_3_i             : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_4_i             : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dp_i                : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);        -- [DP4 DP3 DP2 DP1]
    dots_i              : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);        -- [L3 L2 L1]
    disp_seg_o          : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_dig_o          : OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
  END COMPONENT;

  ------------------------------------------------------------------------------

  COMPONENT btn_in
  GENERIC(
    DEB_PERIOD          : INTEGER := 10);
  PORT(
    clk                 : IN  STD_LOGIC;
    ce                  : IN  STD_LOGIC;
    btn_i               : IN  STD_LOGIC;
    btn_deb_o           : OUT STD_LOGIC;
    btn_posedge_o       : OUT STD_LOGIC;
    btn_negedge_o       : OUT STD_LOGIC;
    btn_edge_o          : OUT STD_LOGIC);
  END COMPONENT;

  --------------------------------------------------------------------------------

  COMPONENT ce_gen
  GENERIC(
    DIV_FACT            : POSITIVE := 2);
  PORT (
    clk                 : IN  STD_LOGIC;
    srst                : IN  STD_LOGIC;
    ce                  : IN  STD_LOGIC;
    ce_o                : OUT STD_LOGIC);
  END COMPONENT;
  
  COMPONENT pwm_driver
  PORT (
    CLK                 : IN  STD_LOGIC;
    PWM_REF_7           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_6           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_5           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_4           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_3           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_2           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_1           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_REF_0           : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
    PWM_OUT             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    CNT_OUT             : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
  END COMPONENT;
COMPONENT ila_pwm

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	probe3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT  ;

COMPONENT vio_pwm
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out6 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out8 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out9 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out10 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out11 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;
  --------------------------------------------------------------------------------

  SIGNAL clk_en_100Hz       : STD_LOGIC;

  SIGNAL pwm_out            : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL cnt_out            : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL btn_deb_o          : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL btn_posedge_o      : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL btn_negedge_o      : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL btn_edge_o         : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL dig_1_i            : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL dig_2_i            : STD_LOGIC_VECTOR( 3 DOWNTO 0);  
  SIGNAL dig_3_i            : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL dig_4_i            : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL pwm_ref_7          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_6          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_5          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_4          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_3          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_2          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_1          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pwm_ref_0          : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  ce_gen_i : ce_gen
  GENERIC MAP(
    DIV_FACT            => 500000)
  PORT MAP(
    clk                 => clk,
    srst                => '0',
    ce                  => '1',
    ce_o                => clk_en_100Hz);

  --------------------------------------------------------------------------------

  GEN_btn_in: FOR i IN 0 TO 3 GENERATE
    btn_in_i : btn_in
    GENERIC MAP(
      DEB_PERIOD          => 5)
    PORT MAP(
      clk                 => clk,
      ce                  => clk_en_100Hz,
      btn_i               => btn_i(i),
      btn_deb_o           => btn_deb_o(i),
      btn_posedge_o       => btn_posedge_o(i),
      btn_negedge_o       => btn_negedge_o(i),
      btn_edge_o          => btn_edge_o(i));
  END GENERATE GEN_btn_in;
  
  --------------------------------------------------------------------------------

--  led_o(7 DOWNTO 0) <= (OTHERS => '0');

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
  PORT MAP(
    clk                 => clk,
    dig_1_i             => dig_1_i,
    dig_2_i             => dig_2_i,
    dig_3_i             => dig_3_i,
    dig_4_i             => dig_4_i,
    dp_i                => "0000",
    dots_i              => "011",
    disp_seg_o          => disp_seg_o,
    disp_dig_o          => disp_dig_o);
----------------------------------------------------------------------------------
  pwm_driver_i : pwm_driver
  PORT MAP(
    CLK                 => clk,
    PWM_REF_7           => pwm_ref_7,
    PWM_REF_6           => pwm_ref_6,
    PWM_REF_5           => pwm_ref_5,
    PWM_REF_4           => pwm_ref_4,
    PWM_REF_3           => pwm_ref_3,
    PWM_REF_2           => pwm_ref_2,
    PWM_REF_1           => pwm_ref_1,
    PWM_REF_0           => pwm_ref_0,
    PWM_OUT             => pwm_out,
    CNT_OUT             => cnt_out
  );
  vio_pwm_i : vio_pwm
  PORT MAP (
    clk => clk,
    probe_in0           => pwm_out,
    probe_in1           => cnt_out,
    probe_out0          => pwm_ref_0,
    probe_out1          => pwm_ref_1,
    probe_out2          => pwm_ref_2,
    probe_out3          => pwm_ref_3 ,
    probe_out4          => pwm_ref_4,
    probe_out5          => pwm_ref_5,
    probe_out6          => pwm_ref_6,
    probe_out7          => pwm_ref_7,
    probe_out8          => dig_1_i,
    probe_out9          => dig_2_i,
    probe_out10         => dig_3_i,
    probe_out11         => dig_4_i
  );
  ila_pwm_i : ila_pwm
  PORT MAP (
	clk => clk,
	probe0 => pwm_out,
	probe1 => cnt_out,
	probe2 => btn_i,
	probe3 => sw_i
  );
    led_o <= pwm_out;
END Structural;
----------------------------------------------------------------------------------
