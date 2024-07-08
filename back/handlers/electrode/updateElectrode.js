const { pool } = require('../../dependencies')

async function UpdateElectrode(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Сбор названий полей в таблице Electrodes
        const fields = await client.query(`SELECT ARRAY_AGG(column_name) AS fields FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'Electrodes'`)
        fieldsArray = fields.rows[0].fields.replace(/[\}{]/g, '').split(',')
        fieldsArray.filter(item => item.endsWith('_id'))
        for (let index = 0; index < fieldsArray.length; index++) {
            if(fieldsArray[index].endsWith('_id'))
                fieldsArray[index] = fieldsArray[index].split('_id').join('')
            else  {
                fieldsArray.splice(index, 1)
                index--
            }
        }

        //Если поле заканчиввается на "_id", то оно имеет внешний ключ. Ищем таблицу и берём из неё id
        let ids = []
        for (let index = 0; index <= Object.keys(object).length; index++) {
            const element = Object.keys(object)[index];
            if(fieldsArray.includes(element)) {
                if(object[element] != null) {
                    console.log(element)
                    if(typeof object[element] == typeof String()) {
                        await client.query(`SELECT id FROM ${'"'+ element[0].toUpperCase()+element.slice(1) + 's"'} WHERE name=$1`, [object[element]]).then((el) => {
                            if(el.rows.length != 0)
                                {
                                    ids.push(el.rows[0].id)
                                }
                            else {
                                delete object[element]
                                index--
                            }
                                
                        })
                    }
                } else {
                    ids.push(null)
                }
            }
        }

        //Запрос к БД на обновление записи
        await client.query(`UPDATE "Electrodes" SET batch_id = $1, fraction_id = $2, pasport_id = $3, charge_mark_id = $4, charge_type_id = $5, electrode_index_id = $6, o_content = $7, fe_content = $8 WHERE id = $9`,[ids[0], ids[1], object.pasport, ids[2], ids[3], ids[4], object.o_content, object.fe_content, object.id])
        
        //В случае успеха вернёт "success" и 200 код, иначе выведет ошибку 
        data.message = "success"
        data.statusCode = 200
    } catch (error) {
        console.error(error. name, error.stack)
    } finally {
        client.release()
    }

    return data
}

module.exports = {
    UpdateElectrode: UpdateElectrode
}