killall kcps64_181002
killall udp2raw_amd64
killall python                                                                                                  
killall nodejs
ulimit -n 65535
nohup ./kcps64_181002 -t "0.0.0.0:17520" -l ":17518" -key test -mtu 1350 -sndwnd 1024 -rcvwnd 1024 -crypt none -mode fast2 -dscp 0 -datashard 0 -parityshard 0 -nocomp> kcptun.log 2>&1 &
nohup ./udp2raw_amd64 -s -l0.0.0.0:17517 -r 127.0.0.1:17518 -k "passwd" --raw-mode faketcp -a > udp.log 2>&1 &
nohup nodejs html.js > nodejs.log 2>&1 &
#nohup ./nrop_linux_amd64 > nrop.log 2>&1 &
#cd /fs
#sh restart.sh
nohup python /shadowsocksr-akkariiin-dev/shadowsocks/server.py -p 17520 -k Ssr123456 -m rc4 -O auth_chain_b -o plain > ssr.log 2>&1 &
cd /shadowsocksr-akkariiin-dev/shadowsocks
