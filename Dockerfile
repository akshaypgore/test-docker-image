FROM ubuntu:24.04
ENV TZ="Asia/Kolkata"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y php libapache2-mod-php php-cli php-cgi curl lynx vim
COPY <<EOF /var/www/html/index.php
    <?php
        phpinfo();
    ?>
EOF
COPY <<EOF /root/start-apache.sh
    #!/bin/sh
    service apache2 start
EOF
RUN chmod +x /root/start-apache.sh
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80
