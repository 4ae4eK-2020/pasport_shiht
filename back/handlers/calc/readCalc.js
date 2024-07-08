const { pool } = require('../../dependencies')

async function ReadCalc(object) {
    //Объект с данными
    const data = {
        message: 'error',
        statusCode: 400
    }

    //Подключение к БД
    const client = await pool.connect()

    try {
        //Запрос на получение данных из таблицы рассчётов
        const results = await client.query(`SELECT al_content, mo_content, v_content, c_content, cr_content, ntc_order_number, directive FROM "Calculations"`)
        
        //Если элемента нет в итоговом рассчёте, то не выводим его на клиент
        let answer = []
        results.rows.forEach(element => {
            let contents = {}
            if (element.al_content > 0 && !null) contents.al = element.al_content
            if (element.mo_content > 0 && !null) contents.mo = element.mo_content
            if (element.v_content > 0 && !null) contents.v = element.v_content
            if (element.c_content > 0 && !null) contents.c = element.c_content
            if (element.cr_content > 0 && !null) contents.cr = element.cr_content
            contents.ntc = element.ntc_order_number
            contents.directive = element.directive
            answer.push(contents)
        });

        //Вносим получившиеся данные в объект
        data.message = answer
        data.statusCode = 200
    } catch (error) {
        console.error(error.name, error.stack)
    } finally {
        client.release()
    }

    return data
}

module.exports = {
    ReadCalc: ReadCalc
}