#Get the base image
FROM node:12.2.0-alpine
#set working directory
WORKDIR /app
# copy code for project
COPY . .
#install packages
RUN npm install
#expose port 
EXPOSE 8000
#run project
CMD ["node","app.js"]

