const { pool } = require('../../dependencies')
//const { bcrypt } = require('bcryptjs')
const user = require('../../routes/user')

async function Authorization(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    const client = await pool.connect()

    try {
        //получаем данные с БД
        const users = client.query(`SELECT name, password FROM "Users" WHERE name = $1`, [object.name])
        if(users.rows.length == 0) {
            data.message = 'неверный логин'
            data.statusCode = 401
            return data
        }
        
        if(user.rows[0] != 1234) {
            data.message = "неверный пароль"
            data.statusCode = 401
            return data
        }

        //Шифруем пароль
        /*const password = bcrypt.hashSync(object.password, 10)
        console.log(password)
        if(!bcrypt.compareSync(object.password, password)) {
            data.message = "неверный пароль"
            data.statusCode = 401
            return data
        }*/

        data.message = "success"
        data.statusCode = 200
    } catch (error) {
        console.error(error)
        data.message = error.name
        data.statusCode = 500
    } finally {
        client.release()
    }

    return data
}

module.exports = {
    Authorization: Authorization
}