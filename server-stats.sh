#!/bin/bash

#Total CPU usage
top -bn2 -d 0.2 | grep "%Cpu" | tail -1 | awk  '{print "CPU usage = " 100-$8 "%"}'
echo	#SPACE

#Total memory usage (Free vs Used include %)
echo "Memory Usage:"
free | awk '/Mem:/ {printf("Free: %.2f%% | Used: %.2f%%\n", $4/$2*100, $3/$2*100)}'
echo	#SPACE


#Total disk usage (Free vs Used include %)
echo "Disk Usage:"
df -h --total | tail -1 | awk '{printf("Free: %s%% | Used: %s\n", 100-$5, $5)}'
echo	#SPACE


#Top 5 processes by CPU
echo "Top 5 processes by CPU:"
ps aux --sort=-%cpu | head -n 6
echo	#SPACE


#Top 5 processes by memory usage
echo "Top 5 processes by memory:"
ps aux --sort=-%mem | head -n 6
