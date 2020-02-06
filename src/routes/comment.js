require('dotenv').config()
const router = require('express').Router()
const url = require('url')
const mysql = require('../dbconfig')
const {auth,admin,restaurant,client,all} = require('../middleware')
const {add,edit,dlt,detail,show} = require('../model/comment.js')

/* Add Comment */
router.post('/',(req,res)=>{
	const {id_item,comment,rating,id_user} = req.body
	const created_on = new Date()
	const updated_on = new Date()
	mysql.execute(add,[id_item,comment,rating,id_user,created_on,updated_on],(err,result,field)=>{
		res.send({success:true,data:result})
	})

	const rate = mysql.execute('SELECT AVG(rating) AS rating FROM review WHERE id_item=?',[id_item],(err,result,field)=>{
		const avgrate = result[0].rating
		mysql.execute('UPDATE item SET rate=? WHERE id_item=?',[avgrate,id_item],(err,result,field)=>{})
	})
})

/* Edit Comment */
router.put('/:id',auth,all,(req,res)=>{
	const {id} = req.params
	const {id_item,comment,rating} = req.body
	const updated_on = new Date()
	mysql.execute(edit,[id_item,comment,rating,updated_on,id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
	const rate = mysql.execute('SELECT AVG(rating) AS rating FROM review WHERE id_item=?',[id_item],(err,result,field)=>{
		const avgrate = result[0].rating
		mysql.execute('UPDATE item SET rate=? WHERE id_item=?',[avgrate,id_item],(err,result,field)=>{})
	})
})

/* Show Comment */
router.get('/show/:id',(req,res)=>{
	const {id} = req.params
	mysql.query(show,[id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Detail Comment */
router.get('/:id',(req,res)=>{
	const {id} = req.params
	mysql.execute(detail,[id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Delete Category */
router.delete('/:id',auth,all,(req,res)=>{
	const {id} = req.params
	mysql.execute('SELECT id_item FROM review WHERE id_comment=?',[id],(err,result,field)=>{
		const id_item = result[0].id_item
		mysql.execute(dlt,[id],(err,result1,field)=>{
			res.send({success: true, data: result1})
			mysql.execute('SELECT AVG(rating) AS rating FROM review WHERE id_item=?',[id_item],(err,result,field)=>{
				const avgrate = result[0].rating
				mysql.execute('UPDATE item SET rate=? WHERE id_item=?',[avgrate,id_item],(err,result,field)=>{})
			})
		})
	})
})

module.exports = router