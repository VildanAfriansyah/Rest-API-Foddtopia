const detail = 'SELECT * FROM restaurant WHERE id_restaurant=?'

const add = 'INSERT INTO restaurant (restaurant,images,descriptions,longitude,created_on,updated_on) VALUES (?,?,?,?,?,?)'

const dlt = 'DELETE FROM restaurant WHERE id_restaurant=?'

const edit = 'UPDATE restaurant SET restaurant=?, images=?, descriptions=?, longitude=?, updated_on=? WHERE id_restaurant=?'

const show = 'SELECT * FROM restaurant'

const item = `SELECT item.*, restaurant.restaurant, item.rate, item.description FROM item  
					LEFT JOIN restaurant ON item.id_restaurant=restaurant.id_restaurant WHERE restaurant.id_restaurant=?`

module.exports = {detail,add,dlt,edit,show,item}