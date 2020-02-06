require('dotenv').config()
const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const mysql = require('../dbconfig')
const {auth,admin,client,restaurant} = require('../middleware')
const {login,detail,add,dlt,edit,show,revoked} = require('../model/user')

/* Login */
router.post('/login',(req,res)=>{
	const {username,password} = req.body
	mysql.execute(login,[username],(err,result,field)=>{
		if(result.length>0){
			if(bcrypt.compareSync(password,result[0].password)){
				const id = result[0].id_user
				const roles = result[0].roles
				const auth = jwt.sign({username,id,roles},process.env.APP_KEY)
				const login = new Date()
				mysql.execute('INSERT INTO revoked_token (token,status,login) VALUES (?,?,?)',[auth,0,login],(err,result,field)=>{return})
				res.send(
					{
						success: true,
						auth
					}
				)
			}else{
				res.send({
					success: false,
					msg: "Incorrect Password"
				})
			}
		}else{
			res.send({
				success: false,
				msg: "Username no Found"
			})
		}
	})
})

/*Forgot Password */
router.put('/forgotpassword', (req, res) => {
    const {username, password} = req.body
    const password_decrypt = bcrypt.hashSync(password)
    const sql = `UPDATE user SET password = ? where username = ?`
    mysql.execute(sql, [password_decrypt, username], (err, result, field) => {
        res.send({succcess: true, data: result})
    })
})

/* Add Users */
router.post('/',(req,res)=>{
	const {nameuser,username,password,roles} = req.body
	const enc_pass = bcrypt.hashSync(password)
	const created_on = new Date()
	const updated_on = new Date()
	mysql.execute(add,[nameuser,username,enc_pass,roles,created_on,updated_on],(err,result,field)=>{
		if(err){
			res.send({succes: false,msg : 'Username already exist'})
		}else{
			res.send({success: true, msg : 'Account has been created', data: result})
		}	
	})
})

/* Delete User*/
router.delete('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	mysql.execute(dlt,[id],(err,result,field)=>{
		res.send({success:true,data: result})
	})
})

/* Edit User */
router.put('/:id',auth,admin,(req,res)=>{
	const {id} = req.params
	const {nameuser,username,password,roles} = req.body
	const enc_pass = bcrypt.hashSync(password)
	const updated_on = new Date()
	mysql.execute(edit,[nameuser,username,enc_pass,roles,updated_on,id],(err,result,field)=>{
		if(err){
			res.send({succes: false,msg : 'Username already exist'})
		}else{
			res.send({success: true, msg : 'Account has been created'})
		}
	})
})

/* Show User */
router.get('/show',auth,admin,(req,res)=>{
	mysql.query(show,[],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Logout */
router.get('/logout',auth,(req,res)=>{
	const token = req.headers['authorization'].substr(7)
	const logout = new Date()
	mysql.query(revoked,[1,logout,token],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Detail User */
router.get('/:id',auth,(req,res)=>{
	const {id} = req.params
	mysql.execute(detail,[id],(err,result,field)=>{
		console.log(result)
		if(result.length == 0){
			res.send({msg: 'Data not found'})
		}else{
			res.send({success:true,data:result[0]})
		}
	})
})


module.exports = router