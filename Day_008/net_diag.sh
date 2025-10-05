#!/bin/bash
#Day 8 of 100 days of devops
#Author: arceuzvx

OUTPUT="network_report.txt"

echo "==== Network Diagnostics Report ====" > $OUTPUT
echo "Generated on: $(date)" >> $OUTPUT
echo "" >> $OUTPUT

# Show network interfaces
echo "[Network Interfaces]" >> $OUTPUT
ip a >> $OUTPUT
echo "" >> $OUTPUT

# Show routing table
echo "[Routing Table]" >> $OUTPUT
ip r >> $OUTPUT
echo "" >> $OUTPUT

# Test connectivity (safe handling for unreachable network)
echo "[Ping Test]" >> $OUTPUT
if ping -c 4 8.8.8.8 >> $OUTPUT 2>&1; then
    echo "Ping successful" >> $OUTPUT
else
    echo "Network unreachable or host not responding" >> $OUTPUT
fi
echo "" >> $OUTPUT

# DNS Resolution test
echo "[DNS Resolution]" >> $OUTPUT
if nslookup google.com >> $OUTPUT 2>&1; then
    echo "DNS resolution successful" >> $OUTPUT
else
    echo "DNS resolution failed" >> $OUTPUT
fi

echo "" >> $OUTPUT
echo "==== End of Report ====" >> $OUTPUT

echo "Network diagnostics completed. Report saved in $OUTPUT"