FROM ubuntu:24.04
# escape=\
ENV TZ="Asia/Kolkata"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y php libapache2-mod-php php-cli php-cgi curl lynx vim
COPY <<EOF /var/www/html/index.php
    <html>
    <body>
    <?php
    \$hostname = gethostname();
    echo "The hostname is: " . \$hostname;
    ?>
    </body>
    </html>
EOF
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80