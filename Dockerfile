FROM ubuntu

RUN apt-get update 
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN app-get install typescript

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json
 
RUN npm install
RUN tsc -p . 
# build

COPY main.js main.js
# for every file in the folder
# Otherwise we to write COPY main.js main.js everytime.
# But before that we need to create .dockerignore file where we will be putting node_modules etc.
# COPY . .

ENTRYPOINT ["node" "main.js"]