const detail = 'SELECT * FROM category WHERE id_category=?'
const add = 'INSERT INTO category (category,created_on,updated_on) VALUES (?,?,?)'
const dlt = 'DELETE FROM category WHERE id_category=?'
const edit = 'UPDATE category SET category=?, updated_on=? WHERE id_category=?'
const show = 'SELECT * FROM category'
const item = `SELECT item.*, category.category FROM item  
					LEFT JOIN category ON item.id_category=category.id_category WHERE category.id_category=?`

module.exports = {detail,add,dlt,edit,show,item}