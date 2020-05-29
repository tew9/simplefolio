#Stage 1, Automate Build, instead of building angular app manually and then use it to be ran in the image
FROM  node:12.16.3-alpine3.11 AS build
WORKDIR /user/src/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#Stage 2, Run 
FROM nginx:stable-alpine
COPY --from=build /user/src/app/dist/tour-heroes /usr/share/nginx/html