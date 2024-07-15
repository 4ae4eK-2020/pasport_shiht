const { pool } = require('../../dependencies')

async function ReadElectrode(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Запрос на получение записей
        const results = await client.query(`SELECT "Charge_types".name AS "charge_type", "Charge_marks".name AS "charge_mark", "mass", "Electrode_indexs".name AS "index", "Fractions".name AS "fraction",
                                        vshm, nv, o_content, fe_content, place_number, "Batchs".name AS batch, "Manufacturers".name AS "manufacturer" FROM "Electrodes"
                                            INNER JOIN "Charge_types" ON "Charge_types".id = "Electrodes".charge_type_id
                                            INNER JOIN "Charge_marks" ON "Charge_marks".id = "Electrodes".charge_mark_id
                                            INNER JOIN "Electrode_indexs" ON "Electrode_indexs".id = "Electrodes".electrode_index_id
                                            LEFT JOIN "Fractions" ON "Fractions".id = "Electrodes".fraction_id
                                            INNER JOIN "Batchs" ON "Batchs".id = "Electrodes".batch_id
                                            INNER JOIN "Manufacturers" ON "Manufacturers".id = "Electrodes".manufacturer_id`)
        
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
    ReadElectrode: ReadElectrode
}