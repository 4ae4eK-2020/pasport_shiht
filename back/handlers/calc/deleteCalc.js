const { pool } = require('../../dependencies')

async function DeleteCalc(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Проверка на существование записи в БД
        const calc = await client.query(`SELECT * FROM "Calculations" WHERE id=$1`, [object.id])
        if (calc.rows.length == 0) {
            data.message = `Calculation №${object.id} does not exist`
            return data
        }
        await client.query(`DELETE FROM "Calculations" WHERE id=$1`, [object.id])
        data.message = `calc №${object.id} was deleted successful`
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
    DeleteCalc: DeleteCalc
}