require('dotenv').config()
const router = require('express').Router()
const multer = require('multer');
const path = require('path')
const mysql = require('../dbconfig')
const {auth,admin,restaurant,client,all} = require('../middleware')
const {add,edit,dlt,detail,show,item} = require('../model/restaurant.js')
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './upload/restaurant');
     },
    filename: function (req, file, cb) {
        cb(null , file.originalname);
    }
});
const fileFilter = function (req, file, cb) {
        var ext = path.extname(file.originalname);
        if(ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg') {
            return cb('Extension not allowed')
        }
        cb(null, true)
    }
var upload = multer({storage: storage,fileFilter: fileFilter})

/* Add Restaurant */
router.post('/',auth,restaurant,upload.single('image'),(req,res)=>{
	const images = (req.file.originalname)
	const {restaurant,description,location,id_user} = req.body
	const created_on = new Date()
	const updated_on = new Date()
	mysql.query(add,[restaurant,images,description,location,created_on,updated_on],(err,result,field)=>{
		console.log(err,updated_on,created_on)
		res.send({success:true,data:result})
	})
})

/* Edit Restaurant */
router.put('/:id',auth,restaurant,upload.single('image'),(req,res)=>{
	const {id} = req.params
	const images = (req.file.originalname)
	const {restaurant,description,location,id_user} = req.body
	const updated_on = new Date()
	console.log(restaurant,images,description,location,updated_on,id)
	mysql.execute(edit,[restaurant,images,description,location,updated_on,id],(err,result,field)=>{
		res.send({success:true,data:result})
		console.log(err)
	})
})

/* Show Restaurant */
router.get('/show',(req,res)=>{
	const {id} = req.params
	mysql.execute(show,[],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Restaurant Item*/
router.get('/item/:id',(req,res)=>{
	const {id} = req.params
	mysql.execute(item,[id],(err,result,field)=>{
		res.send({success:true,data:result})
		console.log(result)
	})
})

/* Detail Restaurant */
router.get('/:id',auth,(req,res)=>{
	const {id} = req.params
	mysql.execute(detail,[id],(err,result,field)=>{
		res.send({success:true,data:result[0]})
	})
})

/* Delete Restaurant */
router.delete('/:id',auth,restaurant,(req,res)=>{
	const {id} = req.params
	mysql.execute(dlt,[id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

module.exports = router