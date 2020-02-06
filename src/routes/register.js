require('dotenv').config()
const bcrypt = require('bcryptjs')
const router = require('express').Router()
const mysql = require('../dbconfig')


/* Add Users */
router.post('/',(req,res)=>{
	const {name_user,username,password} = req.body
	const enc_pass = bcrypt.hashSync(password)
	const updated_on = new Date()
	const created_on = new Date()
	const sql = 'INSERT INTO user (name_user,username,password,roles,created_on,updated_on) VALUES (?,?,?,?,?,?)'
	mysql.execute(sql,[,name_user,username,enc_pass,'client',created_on,updated_on],(err,result,field)=>{
		if(err){
			res.send({succes: false,msg : 'Username already exist'})
		}else{
			res.send({success: true, msg : 'Account has been created',data: result})
		}
	})
})

module.exports = router