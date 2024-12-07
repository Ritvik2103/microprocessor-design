#create clock
create_clock -period 5.800 -name sys_clock [get_ports clk]

#clock latency
set_clock_latency 1.2 -source [get_clocks sys_clock]
 
#input delay 
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {instruction[0]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {instruction[1]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {instruction[2]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {instruction[3]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {read_sel1[0]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {read_sel1[1]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {read_sel2[0]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {read_sel2[1]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports reset]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {write_sel[0]}]
set_input_delay -clock [get_clocks sys_clock] 1.200 [get_ports {write_sel[1]}]

#output dela
set_output_delay -clock [get_clocks sys_clock] 0.1 [all_outputs]


group_path -name {i2o} -from [all_inputs] -to [all_outputs]
group_path -name {i2r} -from [all_inputs] -to [all_registers -data_pins]
group_path -name {r2r} -from [all_registers -clock_pins] -to [all_registers -data_pins]
group_path -name {r2o} -from [all_registers -clock_pins] -to [all_outputs]


