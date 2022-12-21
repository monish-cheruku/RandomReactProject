# FROM  node:17-alpine

# WORKDIR /app
# COPY package.json .
# # COPY pnpm-lock.yaml .
# COPY ./node_modules ./node_modules
# # COPY ["package*.json","./"]
# # RUN npm config set proxy http://proxysrv-in.belcan.com:3128
# # RUN npm config set https-proxy https://proxysrv-in.belcan.com:3128
# # RUN npm config set strict-ssl false
# # RUN npm config set registry http://registry.npmjs.org/
# RUN npm install

# COPY . .

# EXPOSE 3000

# CMD ["npm" ,"run" ,"dev"]



FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json .
# RUN ["ls -a"]
# RUN export http_proxy="http://proxysrv-in.belcan.com:3128"
# RUN export https_proxy="http://proxysrv-in.belcan.com:3128"
# RUN npm config set proxy null
# RUN npm config set https-proxy null
# RUN npm config set registry "http://registry.npmjs.org/"

RUN npm config set proxy "http://proxysrv-in.belcan.com:3128"
RUN npm config set https-proxy "http://proxysrv-in.belcan.com:3128"

COPY . .


RUN npm install
# COPY node_modules ./node_modules
# RUN npm install react-scripts@3.4.1 -g
# CMD ["ls"] 
# add app
EXPOSE 3000
# start app
CMD npm start