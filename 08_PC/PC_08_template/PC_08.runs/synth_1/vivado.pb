
s
Command: %s
53*	vivadotcl2B
.synth_design -top rp_top -part xc7z010clg400-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7z010clg400-12default:defaultZ21-403h px? 
?
%s*synth2?
xStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 923.879 ; gain = 235.680
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
rp_top2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
162default:default8@Z8-638h px? 
b
%s
*synth2J
6	Parameter DIV_FACT bound to: 500000 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ce_gen2default:default2Y
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/ce_gen.vhd2default:default2
272default:default2
ce_gen_i2default:default2
ce_gen2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1332default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
ce_gen2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/ce_gen.vhd2default:default2
422default:default8@Z8-638h px? 
b
%s
*synth2J
6	Parameter DIV_FACT bound to: 500000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
ce_gen2default:default2
12default:default2
12default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/ce_gen.vhd2default:default2
422default:default8@Z8-256h px? 
_
%s
*synth2G
3	Parameter DEB_PERIOD bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
btn_in2default:default2Y
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
52default:default2
btn_in_i2default:default2
btn_in2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
btn_in2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
182default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter DEB_PERIOD bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sync_reg2default:default2b
ND:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/sync_reg.vhd2default:default2
52default:default2

sync_reg_i2default:default2
sync_reg2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
602default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
sync_reg2default:default2d
ND:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/sync_reg.vhd2default:default2
122default:default8@Z8-638h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
shreg_extract2default:default2
NO2default:default2d
ND:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/sync_reg.vhd2default:default2
152default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	async_reg2default:default2
TRUE2default:default2d
ND:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/sync_reg.vhd2default:default2
152default:default8@Z8-5534h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
sync_reg2default:default2
22default:default2
12default:default2d
ND:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/sync_reg.vhd2default:default2
122default:default8@Z8-256h px? 
_
%s
*synth2G
3	Parameter DEB_PERIOD bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	debouncer2default:default2c
OD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/debouncer.vhd2default:default2
52default:default2
debouncer_i2default:default2
	debouncer2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
682default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	debouncer2default:default2e
OD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/debouncer.vhd2default:default2
152default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter DEB_PERIOD bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	debouncer2default:default2
32default:default2
12default:default2e
OD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/debouncer.vhd2default:default2
152default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
edge_detector2default:default2g
SD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/edge_detector.vhd2default:default2
52default:default2#
edge_detector_i2default:default2!
edge_detector2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
792default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
edge_detector2default:default2i
SD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/edge_detector.vhd2default:default2
142default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
edge_detector2default:default2
42default:default2
12default:default2i
SD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in/edge_detector.vhd2default:default2
142default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
btn_in2default:default2
52default:default2
12default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
182default:default8@Z8-256h px? 
_
%s
*synth2G
3	Parameter DEB_PERIOD bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
btn_in2default:default2Y
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
52default:default2
btn_in_i2default:default2
btn_in2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-3491h px? 
_
%s
*synth2G
3	Parameter DEB_PERIOD bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
btn_in2default:default2Y
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
52default:default2
btn_in_i2default:default2
btn_in2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-3491h px? 
_
%s
*synth2G
3	Parameter DEB_PERIOD bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
btn_in2default:default2Y
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/btn_in.vhd2default:default2
52default:default2
btn_in_i2default:default2
btn_in2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
seg_disp_driver2default:default2?
?D:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/PC_08.runs/synth_1/.Xil/Vivado-10624-PC-096/realtime/seg_disp_driver_stub.vhdl2default:default2
52default:default2%
seg_disp_driver_i2default:default2#
seg_disp_driver2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1772default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2#
seg_disp_driver2default:default2?
?D:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/PC_08.runs/synth_1/.Xil/Vivado-10624-PC-096/realtime/seg_disp_driver_stub.vhdl2default:default2
202default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

pwm_driver2default:default2]
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
62default:default2 
pwm_driver_i2default:default2

pwm_driver2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1892default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2

pwm_driver2default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
222default:default8@Z8-638h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_02default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_12default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_22default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_32default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_42default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_52default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_62default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	PWM_REF_72default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
412default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2

pwm_driver2default:default2
62default:default2
12default:default2_
ID:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/pwm_driver.vhd2default:default2
222default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
vio_pwm2default:default2?
yD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/PC_08.runs/synth_1/.Xil/Vivado-10624-PC-096/realtime/vio_pwm_stub.vhdl2default:default2
52default:default2
	vio_pwm_i2default:default2
vio_pwm2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
2032default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
vio_pwm2default:default2?
yD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/PC_08.runs/synth_1/.Xil/Vivado-10624-PC-096/realtime/vio_pwm_stub.vhdl2default:default2
262default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ila_pwm2default:default2?
yD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/PC_08.runs/synth_1/.Xil/Vivado-10624-PC-096/realtime/ila_pwm_stub.vhdl2default:default2
52default:default2
	ila_pwm_i2default:default2
ila_pwm2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
2212default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
ila_pwm2default:default2?
yD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/PC_08.runs/synth_1/.Xil/Vivado-10624-PC-096/realtime/ila_pwm_stub.vhdl2default:default2
162default:default8@Z8-638h px? 
?
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2 
pwm_driver_i2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1892default:default8@Z8-6071h px? 
?
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2*
GEN_btn_in[3].btn_in_i2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-6071h px? 
?
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2*
GEN_btn_in[2].btn_in_i2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-6071h px? 
?
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2*
GEN_btn_in[1].btn_in_i2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-6071h px? 
?
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2*
GEN_btn_in[0].btn_in_i2default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
1452default:default8@Z8-6071h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
rp_top2default:default2
72default:default2
12default:default2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.vhd2default:default2
162default:default8@Z8-256h px? 
?
%s*synth2?
xFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 999.355 ; gain = 311.156
2default:defaulth px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 999.355 ; gain = 311.156
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 999.355 ; gain = 311.156
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
999.3552default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2
iD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/seg_disp_driver/seg_disp_driver_in_context.xdc2default:default2'
seg_disp_driver_i	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2
iD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/seg_disp_driver/seg_disp_driver_in_context.xdc2default:default2'
seg_disp_driver_i	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2z
dd:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/IP/vio_pwm/vio_pwm/vio_pwm_in_context.xdc2default:default2
	vio_pwm_i	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2z
dd:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/IP/vio_pwm/vio_pwm/vio_pwm_in_context.xdc2default:default2
	vio_pwm_i	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2z
dd:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/IP/ila_pwm/ila_pwm/ila_pwm_in_context.xdc2default:default2
	ila_pwm_i	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2z
dd:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/IP/ila_pwm/ila_pwm/ila_pwm_in_context.xdc2default:default2
	ila_pwm_i	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2[
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2Y
ED:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/SOURCES/rp_top.xdc2default:default2,
.Xil/rp_top_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1084.4102default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0072default:default2
1084.4102default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Constraint Validation : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1084.410 ; gain = 396.211
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7z010clg400-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1084.410 ; gain = 396.211
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1084.410 ; gain = 396.211
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 1084.410 ; gain = 396.211
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     19 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               19 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 21    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     19 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 8     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
;
%s
*synth2#
Module ce_gen 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     19 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               19 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     19 Bit        Muxes := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
Module sync_reg 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
>
%s
*synth2&
Module debouncer 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
B
%s
*synth2*
Module edge_detector 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 4     
2default:defaulth p
x
? 
?
%s
*synth2'
Module pwm_driver 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 3     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 80 (col length:40)
BRAMs: 120 (col length: RAMB18 40 RAMB36 20)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1084.410 ; gain = 396.211
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1084.410 ; gain = 396.211
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1106.672 ; gain = 418.473
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:00:28 ; elapsed = 00:00:28 . Memory (MB): peak = 1106.672 ; gain = 418.473
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
Q
%s
*synth29
%+------+----------------+----------+
2default:defaulth p
x
? 
Q
%s
*synth29
%|      |BlackBox name   |Instances |
2default:defaulth p
x
? 
Q
%s
*synth29
%+------+----------------+----------+
2default:defaulth p
x
? 
Q
%s
*synth29
%|1     |seg_disp_driver |         1|
2default:defaulth p
x
? 
Q
%s
*synth29
%|2     |vio_pwm         |         1|
2default:defaulth p
x
? 
Q
%s
*synth29
%|3     |ila_pwm         |         1|
2default:defaulth p
x
? 
Q
%s
*synth29
%+------+----------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
T
%s*synth2<
(+------+-----------------------+------+
2default:defaulth px? 
T
%s*synth2<
(|      |Cell                   |Count |
2default:defaulth px? 
T
%s*synth2<
(+------+-----------------------+------+
2default:defaulth px? 
T
%s*synth2<
(|1     |ila_pwm_bbox_2         |     1|
2default:defaulth px? 
T
%s*synth2<
(|2     |seg_disp_driver_bbox_0 |     1|
2default:defaulth px? 
T
%s*synth2<
(|3     |vio_pwm_bbox_1         |     1|
2default:defaulth px? 
T
%s*synth2<
(|4     |BUFG                   |     1|
2default:defaulth px? 
T
%s*synth2<
(|5     |CARRY4                 |     8|
2default:defaulth px? 
T
%s*synth2<
(|6     |LUT2                   |     3|
2default:defaulth px? 
T
%s*synth2<
(|7     |LUT4                   |    64|
2default:defaulth px? 
T
%s*synth2<
(|8     |LUT6                   |     8|
2default:defaulth px? 
T
%s*synth2<
(|9     |FDRE                   |    36|
2default:defaulth px? 
T
%s*synth2<
(|10    |IBUF                   |     9|
2default:defaulth px? 
T
%s*synth2<
(|11    |OBUF                   |    21|
2default:defaulth px? 
T
%s*synth2<
(+------+-----------------------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
d
%s
*synth2L
8+------+---------------------------+-----------+------+
2default:defaulth p
x
? 
d
%s
*synth2L
8|      |Instance                   |Module     |Cells |
2default:defaulth p
x
? 
d
%s
*synth2L
8+------+---------------------------+-----------+------+
2default:defaulth p
x
? 
d
%s
*synth2L
8|1     |top                        |           |   243|
2default:defaulth p
x
? 
d
%s
*synth2L
8|2     |  \GEN_btn_in[0].btn_in_i  |btn_in__1  |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|3     |    sync_reg_i             |sync_reg_2 |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|4     |  \GEN_btn_in[1].btn_in_i  |btn_in__2  |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|5     |    sync_reg_i             |sync_reg_1 |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|6     |  \GEN_btn_in[2].btn_in_i  |btn_in__3  |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|7     |    sync_reg_i             |sync_reg_0 |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|8     |  \GEN_btn_in[3].btn_in_i  |btn_in     |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|9     |    sync_reg_i             |sync_reg   |     3|
2default:defaulth p
x
? 
d
%s
*synth2L
8|10    |  pwm_driver_i             |pwm_driver |   107|
2default:defaulth p
x
? 
d
%s
*synth2L
8+------+---------------------------+-----------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Runtime : Time (s): cpu = 00:00:24 ; elapsed = 00:00:31 . Memory (MB): peak = 1114.227 ; gain = 340.973
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:33 ; elapsed = 00:00:33 . Memory (MB): peak = 1114.227 ; gain = 426.027
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1114.2272default:default2
0.0002default:defaultZ17-268h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
82default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1120.3402default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
482default:default2
82default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:392default:default2
00:00:412default:default2
1120.3402default:default2
710.1682default:defaultZ17-268h px? 
?
4The following parameters have non-default value.
%s
395*common24
 tcl.collectionResultDisplayLimit2default:defaultZ17-600h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1120.3402default:default2
0.0002default:defaultZ17-268h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2d
PD:/Documents/xjasek15/MPC-PLD/08_PC/PC_08_template/PC_08.runs/synth_1/rp_top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2v
bExecuting : report_utilization -file rp_top_utilization_synth.rpt -pb rp_top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Apr  4 09:59:27 20222default:defaultZ17-206h px? 


End Record