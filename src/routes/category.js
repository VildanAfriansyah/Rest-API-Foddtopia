require('dotenv').config()
const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth,admin,restaurant,client,all} = require('../middleware')
const {add,edit,dlt,detail,show,item} = require('../model/category.js')

/* Add Category */
router.post('/',auth,admin,(req,res)=>{
	const {category} = req.body
	const created_on = new Date()
	const updated_on = new Date()
	mysql.execute(add,[category,created_on,updated_on],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Edit Category */
router.put('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	const {category} = req.body
	const updated_on = new Date()
	mysql.execute(edit,[category,updated_on,id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Show category */
router.get('/show',(req,res)=>{
	mysql.query(show,[],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Category Item*/
router.get('/item/:id',(req,res)=>{
	const {id} = req.params
	mysql.execute(item,[id],(err,result,field)=>{
		res.send({success:true,data:result})
		console.log(result)
	})
})

/* Detail Category */
router.get('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	mysql.execute(detail,[id],(err,result,field)=>{
		res.send({success:true,data:result[0]})
	})
})

/* Delete Category */
router.delete('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	mysql.execute(dlt,[id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

module.exports = router