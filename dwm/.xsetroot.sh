DATETIME=`date "+%H:%M:%S %d/%m/%y"`
BATTERYSTATE=$( acpi -b | awk '{ split($5,a,":"); print substr($3,0,2), $4, "["a[1]":"a[2]"]" }' | tr -d ',' )
CPU=$( mpstat | grep all | awk '{print $3}' )
MEM=$( free -m | grep Mem | awk '{print $7}' )
xsetroot -cursor_name left_ptr -name "CPU: ${CPU} | RAM: ${MEM}MB | Battery: ${BATTERYSTATE} | ${DATETIME} "
