@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Feb 21 08:51:11 +0100 2022
REM SW Build 2729669 on Thu Dec  5 04:49:17 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 2ed19e8f9b504d899d2854ded591d96d --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot simple_adder_tb_behav xil_defaultlib.simple_adder_tb -log elaborate.log"
call xelab  -wto 2ed19e8f9b504d899d2854ded591d96d --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot simple_adder_tb_behav xil_defaultlib.simple_adder_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
