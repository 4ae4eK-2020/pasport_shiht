const { pool } = require('../dependencies')

async function Test(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //подключение к БД
    const client = await pool.connect()

    //Если всё хорошо - возвращает data.message и 200 статус, иначе ошибку
    try {
        
        data.message = "test complieted"
        data.statusCode = 200
    } catch (error) {
        console.error(error)
    } finally {
        //завершение подключения, чтобы не занимать слот в БД
        client.release()
    }

    return data
}

//Экспорт модуля
module.exports = {
    Test: Test
}