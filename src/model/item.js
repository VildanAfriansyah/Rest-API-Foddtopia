const detail	= 	`SELECT item.id_item, item.item_name, item.description, item.id_category, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category
					WHERE id_item=?`

const add 		= 	'INSERT INTO item (item_name,rate,id_category,id_restaurant,price,images,description,created_on,updated_on) VALUES (?,?,?,?,?,?,?,?,?)'

const dlt	 	=	'DELETE FROM item WHERE id_item=?'

const edit 		=	'UPDATE item SET item_name=?, id_category=?, images=?, id_restaurant=?, price=?, description=?, updated_on=? WHERE id_item=?'


const show 		= 	`SELECT item.id_item, item.item_name, item.images, item.price, restaurant.restaurant, item.rate, item.description FROM item  
					LEFT JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant LIMIT ? OFFSET ?`

const search 	=	`SELECT item.*, category.category,  category.id_category, restaurant.restaurant FROM item 
					LEFT JOIN category ON item.id_category=category.id_category
					LEFT JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant
					WHERE item_name LIKE ? && rate LIKE ? && price LIKE ?`

const showcase	=	`SELECT item.id_item, item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category
					WHERE item.id_category LIKE ? && id_item !=? ORDER BY rate DESC LIMIT 6 OFFSET 0`

const pagination = 	`SELECT item.item_name, category.category, item.images, item.price, item.rate, restaurant.restaurant FROM item  
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN category ON item.id_category=category.id_category 
					WHERE item_name LIKE ? && rate LIKE ? && price LIKE ? ORDER BY rate DESC LIMIT ? OFFSET ?`

const sql = {
	count: 'SELECT COUNT(*) AS result FROM item',
	get: 'SELECT * FROM item',
	findImage: 'SELECT images FROM item WHERE id = ?',
	updateImage: 'UPDATE item SET images = ? WHERE id_item = ?',
	};

module.exports = {detail,add,dlt,edit,show,search,showcase,pagination,sql}