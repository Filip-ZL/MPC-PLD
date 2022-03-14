# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.cache/wt [current_project]
set_property parent.project_path D:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo d:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files -quiet D:/Documents/xjasek15/MPC-PLD/05_PC/PC_05_template/SOURCES/seg_disp_driver.dcp
set_property used_in_implementation false [get_files D:/Documents/xjasek15/MPC-PLD/05_PC/PC_05_template/SOURCES/seg_disp_driver.dcp]
read_vhdl -library xil_defaultlib {
  D:/Documents/xjasek15/MPC-PLD/05_PC/PC_05_template/SOURCES/FSM.vhd
  D:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.srcs/sources_1/new/btn_in.vhd
  D:/Documents/xjasek15/MPC-PLD/05_PC/PC_05_template/SOURCES/ce_gen.vhd
  D:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.srcs/sources_1/new/debouncer.vhd
  D:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.srcs/sources_1/new/edge_detector.vhd
  D:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.srcs/sources_1/new/stopwatch.vhd
  D:/Documents/xjasek15/MPC-PLD/05_PC/stopwatch/stopwatch.srcs/sources_1/new/sync_reg.vhd
  D:/Documents/xjasek15/MPC-PLD/05_PC/PC_05_template/SOURCES/rp_top.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Documents/xjasek15/MPC-PLD/05_PC/PC_05_template/SOURCES/rp_top.xdc
set_property used_in_implementation false [get_files D:/Documents/xjasek15/MPC-PLD/05_PC/PC_05_template/SOURCES/rp_top.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top rp_top -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef rp_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file rp_top_utilization_synth.rpt -pb rp_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
