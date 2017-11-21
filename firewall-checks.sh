#!/bin/bash
version=$(rpm -q --queryformat '%{RELEASE}' rpm | grep -o [[:digit:]]*\$)
#IPT=$(iptables -L -n | grep ACCEPT | grep dpt | awk -F':' '{print $NF}')
#SERV=$(systemctl status firewalld | grep Active | awk '{print $2}')
EXPR='active'

  if [ "$version" == "7" ]
        then
    SERV=$(systemctl status firewalld | grep Active | awk '{print $2}')
        open=$(firewall-cmd --list-ports)

        if [ "$SERV" = "$EXPR" ]
                then
                echo $(firewall-cmd --list-ports)
                ./firewall7.sh > /var/log/firewalllist
                exit
        elif [ "$open" == "" ]
                    then
                            echo "ACCEPT ALL"
                            exit

        else
                echo $SERV
                exit
        fi


  else
        SERV6=$(service iptables status | grep not | awk '{ print $4 }')
            open2=$(iptables -L -n | grep ACCEPT | grep dpt | awk -F':' '{print $NF}')

            if [ "$SERV6" = 'not' ]
            then
                echo 'inactive'
                        exit

                elif [ "$open2" == "" ]
            then
                echo "ACCEPT ALL"
                exit
                else
                echo $(iptables -L -n | grep ACCEPT | grep dpt | awk -F':' '{print $NF}')
                ./firewall6.sh > /var/log/firewalllist
                    exit

        fi

  fi
