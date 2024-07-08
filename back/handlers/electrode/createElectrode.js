const { pool } = require('../../dependencies')

async function CreateElectrode(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    const client = await pool.connect()

    try {
        //Переменные для обработки
        let args = []
        let validString = ""
        let nullArgsCount = 0
        let canBeNullArgs = ["place_number","o_content", "fe_content", "fraction_id"]
        let canBeZero = ["nv", "vshm"]
        let notNullArgs = ""

        //Поиск id в таблицах по имени
        for (let index = 7; index < Object.keys(object).length; index++) {
            const element = Object.keys(object)[index];
            if(object[element] != null && object[element].length != 0 && object[element] != 0) {
                let objData = await client.query(`SELECT id FROM ${'"'+ element[0].toUpperCase()+element.slice(1) + 's"'} WHERE name=$1`, [object[element]]).then((el) => { return el.rows[0].id})
                args.push(objData)
            }
        }
        
        //Считаем сколько нам нужно полей заполнить, исключая null и пустые значения
        for (let index = 0; index < Object.keys(object).length; index++) {
            const element = Object.keys(object)[index];
            if(object[element] != null && object[element].length != 0) {
                if(canBeZero.includes(element) || object[element] != 0) {
                    validString += `$${index+1-nullArgsCount}, `
                } else nullArgsCount++
            }
            else nullArgsCount++
        }
        //Чистим конец строки от ", " для предотвращения ошибки
        validString = validString.slice(0, -2)
        
        //Добавляем в массив для запроса данные, у которых предусмотрена возможность null
        canBeNullArgs.forEach(element => {
            if(object[element.split('_')[0]] != null && object[element.split('_')[0]].length != 0 && object[element.split('_')[0]] != 0) {
                notNullArgs += element + ", "
                args.push(element.split('_')[0])
            }
        });

        //Запрос к БД на создание записи
        const results = await client.query(`INSERT INTO "Electrodes" (mass, nv, vshm, pasport_id, ${notNullArgs} batch_id, manufacturer_id,
            charge_mark_id, charge_type_id, electrode_index_id)
        VALUES (${validString}) RETURNING id`, [object.mass, object.nv, object.vshm, object.pasport, ...args])

        //Если всё прошло хорошо, то вернётся id новой записи и 200 статус, иначе выведет ошибку 
        data.message = results.rows[0].id
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
    CreateElectrode: CreateElectrode
}