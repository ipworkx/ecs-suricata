# ecs-suricata

Because the version of Rob Cowart was outdated and Elastic itself wasn't doing kafka in between, I modded it al together.

This is the first version of a suricata with kibana 7.6.0 using ECS compliant scheme.
It is compatible with SIEM.

As input source I used kafka. All sensors push raw surciata json data into a kafka topic. 
To do this job I used beats

A example filebeat.yml is included 

![Main Screen](https://github.com/ipworkx/ecs-suricata/blob/master/images/Main%20Dashboard%20(Overview)%20-%20Kibana.png)

![Main Screen](https://github.com/ipworkx/ecs-suricata/blob/master/images/Suricata%20Alerts%20(Messages)%20-%20Kibana.png)

