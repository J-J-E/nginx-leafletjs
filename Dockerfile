FROM nginx:1.10.1-alpine

ADD ./preconfigure.sh /preconfigure.sh
COPY ./autosize.js /usr/share/nginx/html

#Documentation
#EXPOSE 80

RUN chmod +x ./preconfigure.sh
CMD ./preconfigure.sh
