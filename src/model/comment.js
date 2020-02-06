const detail	= 	`SELECT user.name_user, item.item_name, review.comment, review.rating FROM review 
					INNER JOIN item on review.id_item=item.id_item
					INNER JOIN user ON user.id_user=review.id_user WHERE id_comment=? LIMIT 5`

const add 		= 	'INSERT INTO review (id_item,comment,rating,id_user,created_on,updated_on) VALUES (?,?,?,?,?,?)'

const dlt	 	=	'DELETE FROM review WHERE id_comment=?'

const edit 		=	'UPDATE review SET id_item=?, comment=?, rating=?, updated_on=? WHERE id_comment=?'

const show 		= 	`SELECT item.id_item, item.item_name, review.comment, review.rating, review.updated_on, user.name_user FROM review 
					INNER JOIN item on review.id_item=item.id_item
					INNER JOIN user ON user.id_user=review.id_user WHERE review.id_item=? LIMIT 5` 

module.exports = {detail,add,dlt,edit,show}