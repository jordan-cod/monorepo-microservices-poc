FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY proxy-headers.conf /etc/nginx/includes/proxy-headers.conf
COPY public/index.html /usr/share/nginx/html/index.html
