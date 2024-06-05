# Tech Test
AWS / Terraform / Ansible / Observability test

## Stories ##

As an SRE <br>
I want to automate the deployment/configuration of an observability stack based on prometheus and grafana <br>
So that I can make myself a cup of coffee and not have to do all the work again! 🤣 <br>

As an SRE <br>
I want to automate the deployment of prometheus scrape target configuration <br>
So that I can make myself a 2nd cup of coffee! 😂 <br>

## Requirements ##

- Use Terraform to create two EC2 instances.
- Use Ansible to deploy the applications.
- Use Ansible to deploy the configurations.
- Use Ansible Community Collections wherever possible;
  - [community.general.terraform](https://docs.ansible.com/ansible/latest/collections/community/general/terraform_module.html)
  - [Ansible Collection for Prometheus](https://github.com/prometheus-community/ansible)
  - [Ansible Collection for Grafana](https://github.com/grafana/grafana-ansible-collection)
- Fork this repository and create a suitable directory structure to hold the following;
  - Hcl to create the Ansible Server.
  - Playbook and hcl to create / configure the Observability server.
  - As you work through the tasks **create individual commits for each step**.
  - Create a pull request back to this repo to submit your results.  Please **do not** squash the commits.
  - Deployment instructions in the READme.md.
- Do **only** as much as **you** want to do. **Do not** feel that you have to complete **all** the tasks, although Task 4 is quite important.

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
