#!/bin/bash
PS3='Modify hosts or reset hosts '
sec=("Modify_hosts" "Reset" "Quit")
select choose in "${sec[@]}"; do
    case $choose in
        "Modify_hosts")
            read -p "Your IP = " IPs
			read -p "Domain = " Domain
			var=$(echo $IPs $Domain)
			echo -e $var >> /etc/hosts
			cat /etc/hosts
            break
			;;
        "Reset")
            mv /etc/hosts.old /etc/hosts
      cat /etc/hosts
			break
            ;;
        "Quit")
            echo "Exit"
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
