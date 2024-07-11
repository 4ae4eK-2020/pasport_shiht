const { pool } = require('../../dependencies')

async function ReadPasport(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Запрос на получение записей
        const results = await client.query(`SELECT "request_number", CONCAT("Contracts".name, ' прил ', "attachment", ' поз ', "position") AS "contract", "Customers".name AS "customer", CONCAT("ntc_order_number", '  ', "directive") AS "ntc", "Appointments"."name" AS "appointment" FROM "Pasports"
                                            INNER JOIN "Calculations" ON "Calculations".id = "Pasports".calc_id
                                            INNER JOIN "Contracts" ON "Contracts".id = "Pasports".contract_id
                                            INNER JOIN "Customers" ON "Customers".id = "Contracts".customer_id
                                            INNER JOIN "Appointments" ON "Appointments".id = "Pasports".appointment_id`)

        
        //В случае успеха отправит записи в виде массива объектов, иначе выведет ошибку
        data.message = results.rows
        data.statusCode = 200
    } catch (error) {
        console.error(error.name, error.stack)
    } finally {
        client.release()
    }

    return data
}

module.exports = {
    ReadPasport: ReadPasport
}