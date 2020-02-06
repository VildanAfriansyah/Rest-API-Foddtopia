<h1 align="center">ExpressJS - Simple Notes App RESTfull API</h1>



Food App is a simple note application specially for backend only. Built with NodeJs using the ExpressJs Framework.
Express.js is a web application framework for Node.js. [More about Express](https://en.wikipedia.org/wiki/Express.js)
## Built With
[![Express.js](https://www.npmjs.com/package/express)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://nodejs.org/en/download/)](https://nodejs.org/)

## Requirements
1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?
1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name restaurant, and Import file [restaurant.sql](restaurant.sql) to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:4040/restaurant)
8. You can see all the end point [here](#end-point)

## Set up .env file
Open .env file on your favorite code editor, and copy paste this code below :
```
APP_PORT=4040
APP_URI=http://localhost:4040
APP_KEY=r35taur4nt

DB_SERVER=localhost
DB_USER=root
DB_PASSWORD=
DB_DATABASE=restaurant
```

## End Point
**1. GET**
* `/user/:id` 
* `/user`
* `/item/:id`
* `/item/show/?page=1&limit=10`
* `/item/search/?item_name=coffee&rate=0&price=15000`
* `/item/sort/?sort=price`
* `/item/pagination/?search=coffee&rate=&price=&page=1&limit=3&sort-=`
* '/category/show'
* '/restaurant'
* `/restaurant/:id` 
* `restaurant/show`
* `/cart/:id`
* `/comment/:id`
* `/roles/show`
* `/roles/:id`
* `/user/logout`


**2. POST**
* `/user`
* `/category`
* `/item`
* `/restaurant`
* '/cart'
* `/comment`
* `/roles`
* `/user/login`
* `/register`

**3. DELETE**
* `/user/5` 
* `/category/:id` 
* `/item/:id` 
* `/restaurant/:id`
* `/cart/delete/?id_user=4&id_item=6`
* `/comment/:id`
* `/roles/:id`

**4. PUT**
* `/user/:id`
* `/item/:id`
* `/category/:id`
* `/restaurant:id`
* `/cart/edit/?id_user=4&id_item=1`
* `/comment/:id`
* `/roles/:id`
