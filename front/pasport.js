//Вешаем обработчик событий после загрузки DOM-дерева
document.addEventListener("DOMContentLoaded", () => {
    loadPassport()
    document.getElementById("print_btn").onclick = printPasport
})

//Загружаем данные о паспорте
function loadPassport() {
    //Создаём экземпляр запроса
    const xhttp = new XMLHttpRequest()
    
    //Запрос на получение данных шапки паспорта
    xhttp.open("GET", "http://localhost:3000/", true)
    xhttp.setRequestHeader("Access-Control-Allow-Methods", '*')
    xhttp.setRequestHeader("Access-Control-Allow-Origin", 'http://localhost:3000')
    xhttp.setRequestHeader("Access-Control-Allow-Headers", 'Content-Type')
    xhttp.setRequestHeader("Content-Type", 'application/json')
    xhttp.send()

    //Ответ сервера
    const response = Object(xhttp.responseText)[0]

    //Заполняем нужные поля данными с сервера
    Object.keys(response).forEach(element => {
        document.getElementById(element).innerText += response[element]
    });

    //Запрос на получение данных таблицы
    xhttp.open("GET", "http://localhost:3000/electrode", true)
    xhttp.setRequestHeader("Access-Control-Allow-Methods", '*')
    xhttp.setRequestHeader("Access-Control-Allow-Origin", 'http://localhost:3000')
    xhttp.setRequestHeader("Access-Control-Allow-Headers", 'Content-Type')
    xhttp.setRequestHeader("Content-Type", 'application/json')
    xhttp.send()

    //Ответ сервера
    response = Object(xhttp.responseText)[0]

    //Подготавливаем строку в таблице
    let tr = document.createElement('tr')
    let th = document.createElement('th').scope = "row"

    //Создаём иерархию в таблице
    tr.appendChild(th)

    //Заполняем необходимые поля
    for (let index = 1; index < Object.keys(response).length; index++) {
        const element = Object.keys(response)[index]
        let th_element = document.createElement('th')
        th_element.textContent = response[element] || '-'
        tr.appendChild(th_element)
    }
    /*
    <tr>
        <th scope="row">Лигатура</th>
        <th>К4-3</th>
        <th>ДП</th>
        <th>-</th>
        <th>334.69</th>
        <th>0</th>
        <th>-</th>
        <th>-</th>
        <th>-</th>
        <th>я123</th>
        <th>24-3/22-135</th>
        <th>УРАЛПРЕДМЕТ</th>
    </tr>
    */

    //Запихиваем готовую строку в таблицу
    document.getElementById("pasport_table").appendChild(tr)
}

function printPasport() {
    let doc = new jsPDF()
    doc.html(document.getElementById("print_tbl"), {
        callback: function (doc) {
            doc.save('pasport.pdf')
        }
    })
}