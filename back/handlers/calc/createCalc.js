const { pool } = require('../../dependencies')

async function CreateCalc(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Создание рассчёта с заданными данными
        const results = await client.query(`INSERT INTO "Calculations" (al_content, mo_content, v_content, c_content, cr_content, ntc_order_number, directive) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id`, [object.al, object.mo, object.v, object.c, object.cr, object.ntc, object.directive])
        data.message = results.rows[0].id
        data.statusCode = 200
    } catch (error) {
        console.error(error.name, error.stack)
    } finally {
        client.release()
    }

    return data
}

//Экспорт модуля
module.exports = {
    CreateCalc: CreateCalc
}