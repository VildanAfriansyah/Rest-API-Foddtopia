const jwt = require('jsonwebtoken')
const mysql = require('./dbconfig')

const auth = (req,res,next)=>{
	if(
		req.headers['authorization'] && 
		req.headers['authorization'].startsWith('Bearer')
	){
		const jwt_token = req.headers['authorization'].substr(7)
		const login = new Date()
		try{
			const user = jwt.verify(jwt_token,process.env.APP_KEY)
			mysql.execute(`SELECT * FROM revoked_token WHERE token=?`,[jwt_token], (err,result,field)=>{
				if(result.length>0){
					var status = result[0].status
					var token = result[0].token
					try{
						if(status == 0){
							next()
						}else{
							res.send({success:false,msg: "You Has Been Logout"})
						}
					}catch(e){
						res.send({success:false,msg:e})
					}
				}else{
					res.send({success:false,msg: "Token not found"})
				}
			})

		}catch(e){
			res.send({success:false,msg:e})
		}
	}else{
		res.send({success:false,msg: "You must be login first"})
	}
	
}


const admin = (req,res,next)=>{
	const {roles} = req.headers
	if(roles=='admin'){
		next();
	}else{
		res.send({success:false,msg: "Access Denied"})
	}
}

const restaurant = (req,res,next)=>{
	const {roles} = req.headers
	if(roles=='restaurant' || roles=='admin'){
		next();
	}else{
		res.send({success:false,msg: "Access Denied"})
	}
}

const client = (req,res,next)=>{
	const {roles} = req.headers
	if(roles=='client' || roles=='admin'){
		next();
	}else{
		res.send({success:false,msg: "Access Denied"})
	}
}

const all = (req,res,next)=>{
	const {roles} = req.headers
	if(roles=='client' || roles=='admin' || roles=='restaurant'){
		next();
	}else{
		res.send({success:false,msg: "Access Denied"})
	}
}

module.exports = {auth,admin,client,restaurant,all}