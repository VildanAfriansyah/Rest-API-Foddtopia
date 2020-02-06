require('dotenv').config()
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser')


const user = require('./src/routes/user')
const item = require('./src/routes/item')
const category = require('./src/routes/category')
const restaurant = require('./src/routes/restaurant')
const cart = require('./src/routes/cart')
const comment = require('./src/routes/comment')
const roles = require('./src/routes/roles')
const register = require('./src/routes/register')

const app = express();

app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json());
// app.use(morgan('dev'))

app.use('/image/item', express.static('upload/item'))
app.use('/image/restaurant', express.static('upload/restaurant'))
app.use('/image/category', express.static('upload/category'))
app.use(cors())
app.use('/user',user)
app.use('/item',item)
app.use('/category',category)
app.use('/restaurant',restaurant)
app.use('/cart',cart)
app.use('/comment',comment)
app.use('/roles',roles)
app.use('/register',register)


const port = process.env.APP_PORT
app.listen(port,()=>{
	console.log('App Listen On Port '+port)
})
