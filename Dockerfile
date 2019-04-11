FROM centos/systemd

RUN yum install -y initscripts wget httpd; yum clean all; systemctl enable httpd.service

RUN wget https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm
RUN rpm -U ./amazon-cloudwatch-agent.rpm
COPY amazon-cloudwatch-agent.json /opt/aws/amazon-cloudwatch-agent/etc/

RUN chmod +x /etc/rc.d/rc.local && echo "/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s" >> /etc/rc.d/rc.local
