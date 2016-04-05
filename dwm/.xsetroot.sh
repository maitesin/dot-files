DATETIME=`date`
BATTERYSTATE=$( acpi -b | awk '{ split($5,a,":"); print substr($3,0,2), $4, "["a[1]":"a[2]"]" }' | tr -d ',' )
HOME_HDD=$( df -h | grep home | awk '{print $4}' )
SYS_HDD=$( df -h | grep /dev/sda2 | awk '{print $4}' )
CPU=$( mpstat | grep all | awk '{print $3}' )
MEM=$( free -m | grep Mem | awk '{print $7}' )
xsetroot -cursor_name left_ptr -name "CPU: ${CPU} | MEM: ${MEM}MB | System: ${SYS_HDD} | Home: ${HOME_HDD} | ${DATETIME} | Battery: ${BATTERYSTATE}"
