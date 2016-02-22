FROM garland/xampp-base

WORKDIR /opt/lampp/htdocs/

# Install DVWA
RUN wget https://github.com/RandomStorm/DVWA/archive/v1.0.8.zip
RUN unzip v1.0.8.zip
RUN mv DVWA-1.0.8 dvwa
RUN sed -i "s/p@ssw0rd//g" dvwa/config/config.inc.php
RUN sed -i "s/<a.*\/a>//g" /opt/lampp/error/include/bottom.html
RUN sed -i "s/<span.*\/span>//g" /opt/lampp/error/include/bottom.html

EXPOSE 80

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ENTRYPOINT /tmp/run.sh

