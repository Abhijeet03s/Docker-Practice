FROM ubuntu as build

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

#Till now we were only building
#Compiling the code => app

# After this we are running the code.
FROM node as runner

WORKDIR /app/

COPY --from=build app/ .

ENTRYPOINT ["node", "main.js"]