require('dotenv').config()
const router = require('express').Router()
const url = require('url')
const mysql = require('../dbconfig')
const {auth,admin,restaurant,client,all} = require('../middleware')
const {add,edit,dlt,detail,checkout} = require('../model/cart.js')

/* Add Cart */
router.post('/',(req,res)=>{
	const {id_item,total,id_user} = req.body
	const created_on = new Date()
	const updated_on = new Date()
	mysql.execute(add,[id_item,total,id_user,created_on,updated_on],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Edit Cart */
router.put('/edit/',auth,client,(req,res)=>{
	var geturl = url.parse(req.url, true).query;
	const {item,total} = req.body
	const id_user = geturl.id_user
	const id_item = geturl.id_item
	const updated_on = new Date()
	mysql.execute(edit,[item,total,updated_on,id_user,id_item],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Delete Cart */
router.delete('/delete/',(req,res)=>{
	const {id_user,id_item} = req.body
	mysql.execute(dlt,[id_user,id_item],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

router.delete('/checkout/',(req,res)=>{
	const {id_user} = req.body
	mysql.execute(checkout,[id_user],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Show Cart */
// router.get('/show/:id',auth,client,(req,res)=>{
// 	const {id} = req.params
// 	mysql.execute(detail,[id],(err,result,field)=>{
// 		res.send({success:true,data:result})
// 	})
// })

/* Detail Cart */
router.get('/:id',auth,(req,res)=>{
	const {id} = req.params
	mysql.execute('SELECT item.price, cart.total FROM cart INNER JOIN item on cart.id_item=item.id_item WHERE id_user=?',[id],(err,result1,field)=>{
		mysql.query('SELECT COUNT(item.price) AS count FROM cart INNER JOIN item on cart.id_item=item.id_item WHERE id_user=?',[id],(err,result,field)=>{
			const count = result[0].count
			var subtotal = 0
			for(i=0;i < count;i++){
				var total = result1[i].price * result1[i].total
				subtotal += total;
			}
			mysql.execute(detail,[id],(err,result1,field)=>{
				res.send({success:true,data:result1,subtotal:subtotal})
			})
		}) 
	})
	
})


module.exports = router