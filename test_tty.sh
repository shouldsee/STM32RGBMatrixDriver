PORT=/dev/ttyACM1
while true;
do
date +"%T. %3N"> $PORT
sleep 0.0001;
done
