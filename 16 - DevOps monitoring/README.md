# DevOps Monitoring

## Goals
The goal of this course is to show the importance of tracking the behavior of applications and infrastructure where these are running, as well as see the types of monitoring tools and how these are used.

## Objectives
- Discuss monitoring concepts
- Implement infrastructure monitoring metrics using Prometheus
- Implement application monitoring metrics using Prometheus
- Managing Alerts
- Create Dashboards


## Contents
- [What is monitoring?](docs/What-is-monitoring.md)
- [What is infrastructure monitoring?](docs/Infrastructure-monitoring.md)
- [What is Application Monitoring?](Application-monitoring.md)
- [Managing Alerts](docs/Managing-alerts.md)
- [Visualization](docs/Visualization.md)

## Popular monitoring tools for Infrastructure Monitoring

There are a lot of monitoring tools in the market that can help to have the adequate monitoring of your IT Infrastructure, these can be licensed products or Opensource tools. Some of the Monitoring tools that have been gaining a lot of popularity in the IT industry are these:

- Under license:
    - New Relic: This monitoring tool is a Saas, it is quite easy to use, you will need to create an account at New Relic portal and start installing the agents you need. It can track Infrastructure metrics as well as network and Application metrics
    - AppDynamics: This is quite similar to the previuos one mentioned, with the difference that this is an On-Premise solution.
    - Splunk: This is one of the most powerful tools in the market, it is an On-premise solution, it can track the log events of almost all IOT, having in real time the infrastructure metrics of almost all the hardware as well as software.
    - DataDog: This is a Cloud solution that can monitor On-Premise and Cloud environments as well, getting metrics from Databases, infrastructure and logs.

- Open source:
    - Prometheus: This Monitoring tool has become one of the favorites of the DevOps area, this due to its capability to track metris from different environments like On-premise, Cloud, virtual machines, containers and more.
    - Zabbix: This monitoring tool has been available since more than 20 years, but it has been till few years ago when popularity has grown exponentialy thanks to its flexibilty on tracking almost any kind of metrics that can be from Infrastructe or Apps.

## Learning materials

For this course we will do a practice with an opensource Monitoring Tool that's also one of the first options in the DevOps world, this is "Prometheus".
The idea of this practice is to install Prometheus and Grafana and see which metrics it catch and read from itself.

| Course | Materials |
| ----------- |-------------:|
| Prometheus Website | https://prometheus.io/ | https://prometheus.io/docs/prometheus/latest/installation/ |
| Tutorial step by step to install Prometheus and Grafana  | https://www.scaleway.com/en/docs/configure-prometheus-monitoring-with-grafana/ |
| Video example of Prometheus and Grafana installation | https://www.youtube.com/watch?v=Kwf-PIcSHmI |



## Course activities
- [Install Prometheus and Grafana](./Lab01.md)


## Collaborators
- Place the name of reach collaborator and slack handle
