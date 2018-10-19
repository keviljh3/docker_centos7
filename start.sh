killall kcps64_170120
killall udp2raw_amd64
killall python                                                                                                  
killall nodejs
ulimit -n 65535
nohup ./kcps64_170120 -t "0.0.0.0:17520" -l ":17518" -key test -mtu 1350 -sndwnd 2048 -rcvwnd 2048 -crypt none -mode fast2 -dscp 46 -datashard 10 -parityshard 3 -keepalive 10 -nocomp> kcptun.log 2>&1 &
nohup ./udp2raw_amd64 -s -l0.0.0.0:17517 -r 127.0.0.1:17518 -k "passwd" --raw-mode faketcp -a > udp.log 2>&1 &
nohup nodejs html.js > nodejs.log 2>&1 &
#nohup ./nrop_linux_amd64 > nrop.log 2>&1 &
#cd /fs
#sh restart.sh
nohup python /shadowsocksr-akkariiin-dev/shadowsocks/server.py -p 17520 -k Ssr123456 -m chacha20-ietf -O auth_chain_e -o tls1.2_ticket_auth_compatible > ssr.log 2>&1 &
#nohup python /shadowsocks-master/shadowsocks/server.py -p 17520 -k Ss123456 -m chacha20-ietf-poly1305 > ss.log 2>&1 &
cd /shadowsocksr-akkariiin-dev/shadowsocks
