#!/bin/bash

# File extractor to extract desired fields from xentracing events
# Developed by Pavan Kumar Paluri
# RT-LAB at UH - 2020

# 10s tracing event for TRC_SCHED_START event that marks beginning and end of do_schedule time spent (but with 1 and 2 \
# as 1D trace buffer vals which help us distinguish b/n  begin and end events
/root/xen/tools/xentrace/xentrace -D -T 10 -e sched sched_start.raw
echo
# xentrace_format command
cat /root/xen/sched_start.raw | /root/xen/tools/xentrace/xentrace_format /root/xen/rule_start.txt > /root/xen/result_start.txt

# to remove either CPU/ end/ start line depending on the rule developed
sed '/^CPU/d' /root/xen/result_start.txt > /root/xen/l1_mod.txt

# to remove the rest of redundant fields from actual lines
awk -F ',' '{$1="";$2="";$3="";$5="";$7="";$8="";$9="";$10=""; print}' /root/xen/l1_mod.txt > /root/xen/l2_mod.txt

# l2_mod.txt should now be only having {start/end, reltsc, PCPU#} 
