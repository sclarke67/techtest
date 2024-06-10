# Tech Test for Cary Galburt

### Tasks Completed: ###

### Implementation ###
- Set up two EC2 instances for Ansible and Observability with AMI specified. Configured bootstrap to give CloudWatch visibility and install SSM agent for better security and avoid having to manage SSH keys
- Configure Observability inbound ports 3000 and 9090

### Assumptions ###
- Backend for tfstate either in S3 or TF enterprise/cloud
- AWS VPC and public/private subnets set up

### What still needs to be done ###
- Install Ansible in bootstrap and configure 
- Install and configure Prometheus, Grafana and node exporter
- Playbook(s)

### Time spent ###

- Approx 3 Hours

### What issues occurred ###

- Difficult to determine what balance to strike between production deploy (and all the time consuming rabbit holes) vs demonstrating
overall approach
- Forgot to fork initially (!) and fixed after the fact. Then git started hanging because my session dropped and I couldn't see the login window behind my screen. 
- Created a readme conflict because I forgot to sync up after editing in the web GUI. 

### Tech Debt and Improvements ###

- Both hard to say within the scope of this exercise, everything is
kind of a work in progress. The idea is to keep things as modular and clear as possible.

### Task 1 - Ansible Server ###

- Use Terraform to create a `Amazon Linux 2 Kernel 5.10 AMI 2.0.20240529.0 x86_64 HVM gp2` EC2 instance AND deploy ansible.

### Task 2 - Observability Server ###

- Use terraform to create a `Amazon Linux 2 Kernel 5.10 AMI 2.0.20240529.0 x86_64 HVM gp2` EC2 instance.
- Deploy an instance of [Prometheus](https://prometheus.io/download/)
- Deploy an instance of [OSS Grafana](https://grafana.com/grafana/download?pg=oss-graf&plcmt=hero-btn-1)
- Deploy an instance of [node exporter](https://github.com/prometheus/node_exporter) [Ansible role](https://prometheus-community.github.io/ansible/branch/main/node_exporter_role.html)
- Configure Prometheus to scrape the node metrics.
- Configure Grafana to show a dashboard of node metrics that would be useful to an SRE.

## Task 3 - Secure Servers ##

- Configure The EC2 instances so that;
  - Only ports 3000 and 9090 on the Observability server are available externally.
 
## Task 4 - Documentation ##

- The functionality that you have implemented.
- What still remains to be implemented.
- How much time you spent on the exercise.
- What problems you encountered and what you did to overcome / work around them.
- What technical debt you have added to your solution.
- What improvements / additional functionality could be added to the solution?
