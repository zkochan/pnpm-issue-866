FROM node:7-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .
COPY shrinkwrap.yaml .
# For npm@5 or later, copy package-lock.json as well
# COPY package.json package-lock.json .

RUN npm install -g pnpm
RUN pnpm install

COPY . .

EXPOSE 8080

CMD [ "npm", "start" ]
