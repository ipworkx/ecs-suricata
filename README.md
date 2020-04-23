# ecs-suricata

This is the first version of a suricata with kibana 7.6.0 using ECS compliant scheme.
It is compatible with SIEM.

As input source I used kafka. All sensors push raw surciata json data into a kafka topic. 
To do this job I used beats

A example filebeat.yml is included 

![Main Screen](link-to-image)
