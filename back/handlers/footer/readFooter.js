const { pool } = require('../../dependencies')

async function ReadFooter(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Запрос на получение записей
        const results = await client.query(`SELECT "press_date", "shift_number", "press_number", "electrode_diameter", "part_count", "part_mass", "up_impoverishment", "down_impoverishment", "electrode_length", "calc_mass" FROM "Pasports"
                                            INNER JOIN "Timesheets" ON "Timesheets".id = "Pasports".timesheet_id
                                            INNER JOIN "Calculations" ON "Calculations".id = "Pasports".calc_id`)

        
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
    ReadFooter: ReadFooter
}