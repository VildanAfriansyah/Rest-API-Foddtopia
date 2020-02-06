const login = 'SELECT * FROM user WHERE username=?'
const detail = 'SELECT * FROM user WHERE id_user=?'
const add = 'INSERT INTO user (name_user,username,password,roles,created_on,updated_on) VALUES (?,?,?,?,?,?)'
const dlt = 'DELETE FROM user WHERE id_user=?'
const edit = 'UPDATE user SET name_user=?, username=?, password=?, roles=?, updated_on=? WHERE id_user=?'
const show = 'SELECT * FROM user'
const revoked = `UPDATE revoked_token SET status=?, logout=? WHERE token=?`

module.exports = {login,detail,add,dlt,edit,show,revoked}