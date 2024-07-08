const { pool } = require('../../dependencies')

async function DeleteElectrode(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Запрос на поиск записи с указанным в object id
        const electrode = await client.query(`SELECT * FROM "Electrodes" WHERE id=$1`, [object.id])
        //Если записи не существует, то вернёт сообщение и 400 ошибку (Плохой запрос)
        if(electrode.rows.length == 0) {
            data.message = `Electrode №${object.id} does not exist`
            return data
        }
        //В противном случае попытается удалит запись с заданным id, и в случае успеха отправит сообщение с кодом 200
        await client.query(`DELETE FROM "Electrodes" WHERE id=$1`, [object.id])
        data.message = `Electrode №${object.id} was deleted successful`
        data.statusCode = 200
    } catch (error) {
        console.error(error.name, error.stack)
    } finally {
        client.release()
    }

    return data
}

module.exports = {
    DeleteElectrode: DeleteElectrode
}