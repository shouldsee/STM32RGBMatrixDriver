PORT=/dev/ttyACM1
sudo chmod 666 $PORT
stty -F $PORT 115200 line 0 min 1 time 5 \
ignbrk -brkint -icrnl -imaxbel \
-opost -onlcr \
-isig -icanon -iexten -echo -echoe -echok -echoctl -echoke

