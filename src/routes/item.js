require('dotenv').config()
const router = require('express').Router()
const url = require('url')
const path = require('path')
const multer = require('multer')
const mysql = require('../dbconfig')
const {auth,admin,client,restaurant,all} = require('../middleware')
const {add,edit,dlt,detail,show,search,showcase,pagination,sql} = require('../model/item')
const urlget = process.env.APP_URI
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './upload/item');
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
const upload = multer({storage: storage,fileFilter: fileFilter})


/* Add Item */
router.post('/',auth,restaurant,upload.single('images'),(req,res)=>{
	const images = (req.file.originalname)
	console.log(images)
	const {item_name,id_category,id_restaurant,price,description} = req.body
	console.log(item_name,id_category,id_restaurant,price,description)
	const created_on = new Date()
	const updated_on = new Date()
	mysql.execute(add,[item_name,'0',id_category,id_restaurant,price,images,description,created_on,updated_on],(err,result,field)=>{
		res.send({succes:true,data:result})
	})

})

/* Edit Item */
router.put('/:id',auth,restaurant,upload.single('images'),(req,res)=>{
	const images = (req.file.originalname)
	console.log(images)
	const {id} = req.params
	const {item_name,id_category,id_restaurant,price,description} = req.body
	const updated_on = new Date()
	mysql.execute(edit,[item_name,id_category,images,id_restaurant,price,description,updated_on,id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Delete Item */
router.delete('/:id',auth,restaurant,(req,res)=>{
	const {id} = req.params
	mysql.execute(dlt,[id],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})

/* Show Item */
router.get('/show',(req,res)=>{
	var geturl = url.parse(req.url, true).query;
	const page = geturl.page
	const limit = geturl.limit
	const offset = page * limit - limit
	const next = `${urlget}item/show?page=${Number(page)+1}&limit=${limit}`
	const prev = `${urlget}item/show?page=${Number(page)-1}&limit=${limit}`
	if(limit == '' || page == ''){
		const sql = `SELECT item.item_name, item.images, item.price, restaurant.restaurant, item.rate, item.description FROM item  
					LEFT JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant`
		mysql.execute(sql,[],(err,result,field)=>{
			res.send({data:result})
		})
	}else{
		mysql.execute(show,[limit,offset],(err,result,field)=>{
			res.send({next:next,prev:prev,data:result})
		})
	}	
});

/* Search Item */
// router.get('/search',(req,res)=>{
// 	var geturl = url.parse(req.url, true).query;
// 	const name = geturl.item_name
// 	const rate = geturl.rate
// 	const price = geturl.price
// 	console.log(name,rate)
// 	mysql.execute(search,["%"+name+"%",rate+"%","%"+price+"%"],(err,result,field)=>{
// 		res.send({success:true,data:result})
// 	})
// });


router.get('/', (req, res) => {
	const url = process.env.APP_URI
	const { query } = req;
	let where = '';
	let sort = '';
	let page = 'LIMIT 6 OFFSET 0';
	let fullUrl = '';
  
	if (query.search) {
	  let count = 1;
	  where += 'WHERE';
	  Object.keys(query.search).forEach((key) => {
		if (Object.keys(query.search).length === 1) {
		  where += ` ${key} LIKE '%${query.search[key]}%'`;
		  fullUrl += `search[${key}]=${query.search[key]}&`;
		  count += 1;
		} else if (Object.keys(query.search).length === count) {
		  where += ` ${key} LIKE '%${query.search[key]}%'`;
		  fullUrl += `search[${key}]=${query.search[key]}&`;
		  count += 1;
		} else {
		  where += ` ${key} LIKE '%${query.search[key]}%' AND`;
		  fullUrl += `search[${key}]=${query.search[key]}&`;
		  count += 1;
		}
	  });
	}
  
	if (query.sort) {
	  if (Object.keys(query.sort).length === 1) {
		sort += 'ORDER BY';
		Object.keys(query.sort).forEach((key) => {
		  sort += ` item.${key} ${query.sort[key]}`;
		  fullUrl += `sort[${key}]=${query.sort[key]}&`;
		});
	  }
	}
  
	if (query.page) {
	  const offset = (Number(query.page) * 6) - 6;
	  page = `LIMIT 6 OFFSET ${offset}`;
	  fullUrl += `page=${query.page}&`;
	} else {
	  query.page = 1;
	}
  
	const sql1 = `${sql.count} ${where}`;
  
	const sql2 = `${sql.get} ${where} ${sort} ${page}`;
	console.log(sql2)
  
	mysql.execute(sql1, (err, result, field) => {
	  if (err) {
		res.send({
		//   uuid: uuidv1(),
		  status: 400,
		  msg: err,
		});
	  } else if (result.length === 0) {
		res.send({
		//   uuid: uuidv1(),
		  status: 400,
		  msg: 'No data retrieved!',
		});
	  } else {
		mysql.execute(sql2, (err2, res2, fie2) => {
		  if (err2) {
			res.send({
			//   uuid: uuidv1(),
			  status: 400,
			  msg: err2,
			});
		  } else if (res2.length === 0) {
			res.send({
			//   uuid: uuidv1(),
			  status: 400,
			  msg: 'No data retrieved!',
			});
		  } else {
			let prev = '';
			let next = '';
  
			const noPage = fullUrl.replace(/page=[0-9\.]+&/g, '');
  
			prev = `${url}item?${noPage}page=${Number(query.page) - 1}`;
			next = `${url}item?${noPage}page=${Number(query.page) + 1}`;
			console.log(query.page, result[0].result)
			console.log(Math.ceil(Number(result[0].result) / 6))
			if (Number(query.page >= 1) === Math.ceil(Number(result[0].result) / 6)) {
				if (result[0].result >=6){
					prev = `${url}item?${noPage}page=${Number(query.page) - 1}`;
					next = ``;
				}else{
					prev = '',
					next = ''
				}
			} else if ((query.page <= 1) === Math.ceil(Number(result[0].result) / 6)) {
				if (result[0].result >=6 ){
					prev = ``;
					next = `${url}item?${noPage}page=${Number(query.page) + 1}`;
				}else if (result[0].result >=6 && (query.page <= 1) === Math.ceil(Number(result[0].result) / 6)){
					prev = '',
					next = ''
				}
			}
  
			res.send({
			//   uuid: uuidv1(),
			  status: 200,
			  info: {
				count: result[0].result,
				pages: Math.ceil(Number(result[0].result) / 6),
				current: `${url}item?${fullUrl}`,
				next,
				previous: prev,
			  },
			  data: res2,
			});
		  }
		});
	  }
	});
  });



/* Sort Item */
router.get('/sort',(req,res)=>{
	var geturl = url.parse(req.url, true).query;
	const sort = geturl.sort
	if(sort == 'rate'){
		const sql = `SELECT item.*, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category ORDER BY rate DESC`
		mysql.execute(sql,[],(err,result,field)=>{
			res.send({success:true,data:result})
		})
	}else if(sort == 'name'){
		const sql = `SELECT item.*, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category ORDER BY item_name ASC`
		mysql.execute(sql,[],(err,result,field)=>{
			res.send({success:true,data:result})
		})
	}else if(sort == 'price'){
		const sql = `SELECT item.*, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category ORDER BY price ASC`
		mysql.execute(sql,[],(err,result,field)=>{
			res.send({success:true,data:result})
		})
	}else if(sort == 'updated'){
		const sql = `SELECT item.*, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category ORDER BY item.updated_on DESC`
		mysql.execute(sql,[],(err,result,field)=>{
			res.send({success:true,data:result})
		})
	}else{
		const sql = `SELECT item.*, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category`
		mysql.execute(sql,[],(err,result,field)=>{
			res.send({success:true,data:result})
		})
	}
});

/* pagination */
router.get('/pagination',(req,res)=>{
	var geturl = url.parse(req.url, true).query;
	const page = geturl.page
	const limit = geturl.limit
	const sort = geturl.sort
	const name = geturl.search
	const rate = geturl.rate
	const price = geturl.price
	const offset = page * limit - limit
	console.log(page,limit,offset,name,rate,price)
	
	if(limit == '' || offset == ''){
			if(sort == 'rate'){
				/* Sort by name,price,rate,updated */
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY rate DESC`
				mysql.execute(sql,["%"+name+"%",rate+"%","%"+price+"%"],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else if(sort == 'name'){
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY item_name ASC`
				mysql.execute(sql,["%"+name+"%",rate+"%","%"+price+"%"],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else if(sort == 'price'){
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY price ASC`
				mysql.execute(sql,["%"+name+"%",rate+"%","%"+price+"%"],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else if(sort == 'updated'){
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY item.updated_on DESC`
				mysql.execute(sql,["%"+name+"%",rate+"%","%"+price+"%"],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else{
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? `
				mysql.execute(sql,["%"+name+"%",rate+"%","%"+price+"%"],(err,result,field)=>{
					res.send({data:result})
				})
			}
		/* Limit and Offset */
		}else{
			if(sort == 'rate'){
				/* Sort by name,price,rate,updated */
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY rate DESC LIMIT ? OFFSET ?`
				mysql.execute(sql,["%"+name+"%",rate+"%","%"+price+"%",limit,offset],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else if(sort == 'name'){
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY item_name ASC LIMIT ? OFFSET ?`
				mysql.execute(sql,[limit,offset],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else if(sort == 'price'){
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY price ASC LIMIT ? OFFSET ?`
				mysql.execute(sql,[limit,offset],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else if(sort == 'updated'){
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY item.updated_on DESC LIMIT ? OFFSET ?`
				mysql.execute(sql,[limit,offset],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}else{
				const sql = `SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
							INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
							INNER JOIN category ON item.id_category=category.id_category 
							WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY rate DESC LIMIT ? OFFSET ?`
				mysql.execute(sql,[limit,offset],(err,result,field)=>{
					res.send({success:true,data:result})
				})
			}
		}	
});



/*Detail Item */
router.get('/:id',(req,res)=>{
	const {id} = req.params
	mysql.execute(detail,[id],(err,result1,field)=>{
		const category = result1[0].id_category
		mysql.execute(showcase,["%"+category+"%",id],(err,result,field)=>{
			res.send({success:true,data:result1,sugest:result})
		})
	})
})

module.exports = router
