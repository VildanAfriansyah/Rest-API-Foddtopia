require('dotenv').config()
const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth,admin,restaurant,client,all} = require('../middleware')
const {add,edit,dlt,detail,show} = require('../model/roles.js')

/* Add roles */
router.post('/',auth,admin,(req,res)=>{
	const {roles} = req.body
	const created_on = new Date()
	const updated_on = new Date()
	mysql.execute(add,[roles,created_on,updated_on],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Edit Roles */
router.put('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	const {roles} = req.body
	const updated_on = new Date()
	mysql.execute(edit,[roles,updated_on,id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Show Roles */
router.get('/show',auth,admin,(req,res)=>{
	mysql.query(show,[],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Detail Roles */
router.get('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	mysql.execute(detail,[id],(err,result,field)=>{
		res.send({success:true,data:result[0]})
	})
})

/* Delete Roles */
router.delete('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	mysql.execute(dlt,[id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

module.exports = router