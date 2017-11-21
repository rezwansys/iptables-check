# iptables-check
IDEA IS need to check iptables rules are configure as per ansible created file “ansible-port-allow “ where it will match two file one is iptables rules and another is ansible-port-allow 
Setps:
1.	import the template
2.	insert all ansible allow sorce IP and Port in the /var/log/ansible-port-allow location
 
3.	give read and write permission in the /var/log/firewalllist
	3.	add the scripts into the zabbix external scripts folder
		 
	3.	add user parameter in the zabbix-agent.conf file
		 
	4.	give scripts appropriate permission
	5.	restart the agent
	
