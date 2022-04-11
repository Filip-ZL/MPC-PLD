----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE std.textio.ALL;
----------------------------------------------------------------------------------
entity FIR_50k_TB is
end FIR_50k_TB;
----------------------------------------------------------------------------------
architecture tb of FIR_50k_TB is
----------------------------------------------------------------------------------

  COMPONENT FIR_50k_wrapper IS
  GENERIC (
    SIM_MODEL                           : BOOLEAN := TRUE
  );
  PORT (
    aclk                                : IN  STD_LOGIC;
    s_axis_data_tvalid                  : IN  STD_LOGIC;
    s_axis_data_tready                  : OUT STD_LOGIC;
    s_axis_data_tdata                   : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid                  : OUT STD_LOGIC;
    m_axis_data_tdata                   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
  END COMPONENT FIR_50k_wrapper;

  -----------------------------------------------------------------------

  SIGNAL sig_SIM_finished               : BOOLEAN := FALSE;

  CONSTANT C_aclk_period                : time := 20 ns;
  SIGNAL aclk                           : STD_LOGIC := '0';

  SIGNAL s_axis_data_tvalid             : STD_LOGIC := '0';
  SIGNAL s_axis_data_tready             : STD_LOGIC;
  SIGNAL s_axis_data_tdata              : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL m_axis_data_tvalid             : STD_LOGIC;
  SIGNAL m_axis_data_tdata              : STD_LOGIC_VECTOR(15 DOWNTO 0);

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------


  --------------------------------------------------------------------------------
  -- Clock process definitions
  --------------------------------------------------------------------------------

  P_aclk: PROCESS
  BEGIN
    aclk <= '0'; WAIT FOR C_aclk_period/2;
    aclk <= '1'; WAIT FOR C_aclk_period/2;
    IF sig_SIM_finished THEN WAIT; END IF;
  END PROCESS P_aclk;


  -----------------------------------------------------------------------
  -- Instantiate the DUT
  -----------------------------------------------------------------------

  FIR_50k_i : FIR_50k_wrapper
  GENERIC MAP(
    SIM_MODEL           => FALSE
  )
  PORT MAP(
    aclk                => aclk,
    s_axis_data_tvalid  => s_axis_data_tvalid,
    s_axis_data_tready  => s_axis_data_tready,
    s_axis_data_tdata   => s_axis_data_tdata,
    m_axis_data_tvalid  => m_axis_data_tvalid,
    m_axis_data_tdata   => m_axis_data_tdata
  );

  -----------------------------------------------------------------------
  -- FIR input
  --    read FIR_data_in.txt
  --    feed the FIR filter with the data from file
  -----------------------------------------------------------------------
  read_txt: PROCESS
    FILE     File_ID        : TEXT;
    VARIABLE line_in        : LINE;
    VARIABLE v_number       : INTEGER;
  BEGIN
    FILE_OPEN(File_ID, "..\..\..\..\SOURCES\FIR_data\FIR_data_in.txt", READ_MODE);
    WAIT UNTIL falling_edge(aclk);
    WHILE NOT ENDFILE(File_ID) LOOP
        READLINE(File_ID, line_in);
        READ(line_in, v_number);
        s_axis_data_tdata  <= STD_LOGIC_VECTOR(TO_SIGNED(v_number, 16));
        s_axis_data_tvalid <= '1'; WAIT FOR C_aclk_period * 1;
        s_axis_data_tvalid <= '0'; WAIT FOR C_aclk_period * 7;
    END LOOP;
    FILE_CLOSE(File_ID);
    sig_SIM_finished <= TRUE;
    WAIT;
  END PROCESS;

  -----------------------------------------------------------------------
  -- FIR output data check
  --    read reference data from FIR_data_out.txt
  --    compare the reference and actual data
  --    report any discrepancy (both a text LOG file and simulator console)
  --    report overall test result
  -----------------------------------------------------------------------
  write_txt: PROCESS
    FILE     File_ID  :       TEXT;
    FILE     File_VAL :       TEXT;
    VARIABLE line_in  :       LINE;
    VARIABLE v_number :       INTEGER;
    VARIABLE line_out :       LINE;
    VARIABLE no_ncorr :       INTEGER := 0;
  BEGIN
    FILE_OPEN(File_ID, "data_out.txt", WRITE_MODE);
    FILE_OPEN(File_VAL, "..\..\..\..\SOURCES\FIR_data\FIR_data_out.txt", READ_MODE);
    WAIT UNTIL falling_edge(aclk);
    WHILE NOT sig_SIM_finished LOOP
        IF m_axis_data_tvalid = '1' THEN
            READLINE(File_VAL, line_in);
            READ(line_in, v_number);
            IF NOT(v_number = TO_INTEGER(SIGNED(m_axis_data_tdata))) THEN
                no_ncorr := no_ncorr + 1;
            END IF;
            WRITE (line_out, "Simulation time: " &
                    TIME'image(NOW) &
                    ", output data (decimal): " &
                    INTEGER'image(TO_INTEGER(SIGNED(m_axis_data_tdata))) & LF);
            REPORT line_out.ALL SEVERITY NOTE;
            WRITELINE (File_ID, line_out);
        END IF;
        WAIT FOR C_aclk_period;
    END LOOP;
    WRITE (line_out, "Simulation done with: " & INTEGER'image(no_ncorr) & " errors");
    REPORT line_out.ALL SEVERITY NOTE;
    WRITELINE (File_ID, line_out);
    FILE_CLOSE(File_VAL);
    FILE_CLOSE(File_ID);
    WAIT;
  END PROCESS;    

----------------------------------------------------------------------------------
end tb;
----------------------------------------------------------------------------------
