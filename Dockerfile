FROM nginx:1.10.1-alpine

ADD ./config.sh /config.sh
COPY ./autosize.js /usr/share/nginx/html
COPY ./vars.sh /vars.sh


RUN chmod +x /config.sh
CMD /config.sh
