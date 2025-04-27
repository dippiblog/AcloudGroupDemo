FROM node:25-alpine

WORKDIR /usr/src/app
COPY app.js .
RUN npm install express

EXPOSE 3000
CMD ["node", "app.js"]
