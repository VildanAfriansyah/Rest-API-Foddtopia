const add 		=	 'INSERT INTO cart (id_item,total,id_user,created_on,updated_on) VALUES (?,?,?,?,?)'

const dlt 		= 	'DELETE FROM cart WHERE id_user=? && id_item=?'

const checkout 		= 	'DELETE FROM cart WHERE id_user=?'

const edit		=	 'UPDATE cart SET id_item=?, total=?, updated_on=? WHERE id_user=? && id_item=?'

const detail 	= 	`SELECT cart.id_cart, user.name_user, user.id_user, item.id_item, item.images, item.item_name, item.price, cart.total, item.rate, restaurant.restaurant FROM cart
					INNER JOIN item ON cart.id_item=item.id_item
					INNER JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant 
					INNER JOIN user ON cart.id_user=user.id_user WHERE cart.id_user=?`

const show 		=	`SELECT item.price, cart.total FROM cart INNER JOIN item on cart.id_item=item.id_item WHERE id_user=?'`

module.exports = {detail,add,dlt,edit,checkout}