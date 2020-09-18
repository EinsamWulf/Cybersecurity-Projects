## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

- https://github.com/EinsamWulf/Cybersecurity-Projects/blob/master/Diagrams/Azure%20Diagram.jpg

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml and filebea-playbook.yml files may be used to install only certain pieces of it, such as Filebeat.

  - install-elk.yml
  - filebeat-playbook.yml (for deploying Filebeat and Metricbeat) 

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly robust and rugged, in addition to restricting access to the network.
- What aspect of security do load balancers protect? What is the advantage of a jump box? 
Load balancers protect the network by supporting the availability portion of the CIA triad, they ensure one system doesn't become overloaded by an abundence of traffic. The advantage of a jumpbox is that it provides a single remote system that can manage and deploy software and services on a variety of systems 
additionally, by using YAML playbooks new system can be quickly stood up as the network grows.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- Filebeat monitors log files or locations as specified by the user and forwards them to Elasticsearch
- Metricbeat collects metrics from the system and services running on the machine

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | DVWA     | 10.0.0.8   | Linux            |
| Web-2    | DVWA     | 10.0.0.9   | Linux            |
| Web-3    | DVWA     | 10.0.0.10  | Linux            |
| ELKServer| ELK      | 10.2.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ELK Server can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 70.179.45.103

Machines within the network can only be accessed by the Jumpbox.


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 70.179.45.103        |
|  Web 1-3 | No                  | N/A                  |
|Loadbalancer| Yes               | HTTP Port 80         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- It is much quicker and easier, once the playbook is written correctly a simple command line input will ensure each machine in a given group is properly configured.

The playbook implements the following tasks:
- Add VM to Hosts file
- Write YAML Playbook to configure docker and install required files (docker.io, python3-pip and docker), ensure required ports are published
- Run playbook
- Verify Traffic is passing from the ELK Server to the Web, this requires that the server is configured send data over port 80

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

- https://github.com/EinsamWulf/Cybersecurity-Projects/blob/master/docker_ps.JPG

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.8, 10.0.0.9, 10.0.0.10

We have installed the following Beats on these machines:
- Filebeat

These Beats allow us to collect the following information from each machine:
Filebeat will look at user specified locations and gather various logfiles such as server logs from Apache such as access.log. Metricbeat gathers metric data on the various services running on a system, staying with the Apache example, Metricbeat would show logon attempts for example.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to ~/etc/ansible/files/.
- Update the hosts file to include the new VMs being added
- Run the playbook, and navigate to http://VM_IP_GOES_HERE:5601/app/kibana. to check that the installation worked as expected.

Answer the following questions to fill in the blanks:_
- Several playbooks are provided, one does the initial installation and conifguration of the ELK server (install-elk.yml) and the other installs Filebeat and Metricbeat (filebeat-playbook.yml). Copy both into your ~/etc/Ansible directory, it is recommended to move the filebeat yml file into the files folder within Ansible.
- Update the hosts file with the IPs of the VMs you want to provision, you can utilize different groups within the hosts file and assign the IP addresses so that when the playbook specifies a particular group that is the group the files are installed on.
- http://VM_IP_GOES_HERE:5601/app/kibana will show if your data is being received, if not the first thing is to ensure your security group is properly configured...also make sure your VMs are on.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
