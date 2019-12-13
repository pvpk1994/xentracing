#!/usr/bin/gnuplot -persist
########## GNU PLOT FOR CREDIT-2 #########
########## Written by Pavan Kumar Paluri ##########
########## Date: Dec-12, 2019 #########
######### Copyright @ 2019 by RT-LAB @ University of Houston. All rights reserved ##########

# Saving to a file
set term png
set output "D_0_V_0.png"

# set titles params
set title "Credit-2 Domain-0 VCPU Event Tracing"
# set labels params
set xlabel "time"
set ylabel "pcpu #"
# Since pcpus range from 0->3
set yrange [-0.5:4]

# set misc params
set grid
set key 

# Pre-set line colors (Status: Under Developement)
vm0_vcpu0 = "red"
vm0_vcpu1 = "blue"
vm0_vcpu2 = "green"
vm0_vcpu3 = "violet"

# Pre-set point types (Status: Under Developement)
vm0_vcpu0_pt = 9 # 9 is for triangle
vm0_vcpu1_pt = 7 # 7 is for circle
vm0_vcpu2_pt = 5 # 5 is for square
vm0_vcpu3_pt = 19 # 27 is for 'o'


#set specific point styles using pre-set conditions (Status: Under Developement)
set style line 1 lc rgb vm0_vcpu0 lt 1 pt vm0_vcpu0_pt
set style line 2 lc rgb vm0_vcpu1 lt 1 pt vm0_vcpu1_pt
set style line 3 lc rgb vm0_vcpu2 lt 1 pt vm0_vcpu2_pt
set style line 4 lc rgb vm0_vcpu3 lt 1 pt vm0_vcpu3_pt


# (Status: Workable verison, needs updates to make it efficient)
# plot format :: plot "name_of_file" using / u  column# (x-axis) : column# (y-axis) title "Name_of_title"
# plot "gnu_plot_credit2.txt" using 2:3 ls 
# For time being, we trace one vcpu and re-run the command by merely changing the # in 0v# to test 
# for other vcpus to see on which pcpus are they running on after tracing is done with xentrace
plot "new_xentrace_credit2.txt" using 2:(strcol(1) eq "0v0" ? $3 : 1/0) title "VCPU-0 of Domain-0"


