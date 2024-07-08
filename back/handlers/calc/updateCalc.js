const { pool } = require('../../dependencies')

async function UpdateCalc(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Запрос на обновление данных
        const results = await client.query(`UPDATE "Calculations" SET al_content=$1, mo_content=$2, v_content=$3, c_content=$4, cr_content=$5, ntc_order_number=$6, directive=$7
            WHERE id = $8`, [object.al, object.mo, object.v, object.c, object.cr, object.ntc, object.directive, object.id])
        
        //Если всё хорошо, то на клиент отправися "success", иначе отработает ошибка
        data.message = "success"
        data.statusCode = 200
    } catch (error) {
        console.error(error.name, error.stack)
    } finally {
        client.release()
    }

    return data
}

module.exports = {
    UpdateCalc: UpdateCalc
}