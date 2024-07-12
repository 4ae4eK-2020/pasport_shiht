const bcryptjs = require('bcryptjs')
const { pool } = require('../../dependencies')

async function Authorization(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    const client = await pool.connect()

    try {
        //получаем данные с БД
        const users = await client.query(`SELECT "password" FROM "Users" WHERE "name" = $1`, [object.login])
        if(users.rows.length == 0) {
            data.message = 'неверный логин'
            data.statusCode = 401
            return data
        }
        
        //Проверка пароля
        if(!bcryptjs.compareSync(object.password, users.rows[0].password)) {
            data.message = "неверный пароль"
            data.statusCode = 401
            return data
        }

        data.message = "success"
        data.statusCode = 200
    } catch (error) {
        console.error(error.name, error.stack)
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