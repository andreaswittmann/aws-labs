#!/bin/bash
# User-Data Script which installs apache webserver and initializes an index pages containing some meta-data
### Webserver installation
yum -y install httpd
service httpd start
service httpd enable
### Create Index Pages
cat <<EOF  > /var/www/html/index.html
<html>
  <h1>Hello from Amazon EC2</h1>
  <p>public-ipv4 = $(curl http://169.254.169.254/latest/meta-data/public-ipv4)</p>
  <p>local-ipv4 = $(curl http://169.254.169.254/latest/meta-data/local-ipv4)</p>
  <p>local-hostname = $(curl http://169.254.169.254/latest/meta-data/hostname)</p>
  <p>public-hostname = $(curl http://169.254.169.254/latest/meta-data/public-hostname)</p>
  <p>ami-id = $(curl http://169.254.169.254/latest/meta-data/ami-id)</p>
  <p>ami-launch-index = $(curl http://169.254.169.254/latest/meta-data/ami-launch-index)</p>
  <p>ami-mainfest-path = $(curl http://169.254.169.254/latest/meta-data/ami-manifest-path)</p>
  <p>profile = $(curl http://169.254.169.254/latest/meta-data/profile)</p>
  <p>instance-type = $(curl http://169.254.169.254/latest/meta-data/instance-type)</p>
  <p>instance-id = $(curl http://169.254.169.254/latest/meta-data/instance-id)</p>
  <p>instance-life-cycle = $(curl http://169.254.169.254/latest/meta-data/instance-life-cycle)</p>
  <p>instance-action = $(curl http://169.254.169.254/latest/meta-data/instance-action)</p>
  <p>user-data = </p>
<xmp>
$(curl http://169.254.169.254/latest/user-data)
</xmp>
</html>
EOF
