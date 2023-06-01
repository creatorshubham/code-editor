FROM node:slim
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
CMD npm start