const detail = 'SELECT * FROM role WHERE id_role=?'
const add = 'INSERT INTO role (role,created_on,updated_on) VALUES (?,?,?)'
const dlt = 'DELETE FROM role WHERE id_role=?'
const edit = 'UPDATE role SET role=?, updated_on=? WHERE id_role=?'
const show = 'SELECT * FROM role'

module.exports = {detail,add,dlt,edit,show}