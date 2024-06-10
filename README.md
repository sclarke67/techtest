# Tech Test for Cary Galburt

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
