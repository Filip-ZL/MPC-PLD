-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Mon Apr  4 09:32:52 2022
-- Host        : PC-096 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/IP/vio_pwm/vio_pwm_stub.vhdl
-- Design      : vio_pwm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_pwm is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_out10 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_out11 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end vio_pwm;

architecture stub of vio_pwm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[7:0],probe_in1[7:0],probe_out0[7:0],probe_out1[7:0],probe_out2[7:0],probe_out3[7:0],probe_out4[7:0],probe_out5[7:0],probe_out6[7:0],probe_out7[7:0],probe_out8[3:0],probe_out9[3:0],probe_out10[3:0],probe_out11[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2019.2.1";
begin
end;
