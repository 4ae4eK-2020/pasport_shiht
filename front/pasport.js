const { jsPDF } = window.jspdf

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
    xhttp.open("GET", "http://localhost:3000/pasport", true)
    xhttp.setRequestHeader("Access-Control-Allow-Methods", 'GET,POST,PUT,DELETE')
    xhttp.setRequestHeader("Access-Control-Allow-Headers", 'Origin,Content-type,Accept')
    xhttp.send()

    //Ответ сервера
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = JSON.parse(xhttp.responseText.substring(1, xhttp.responseText.length-1))
             //Заполняем нужные поля данными с сервера
            Object.keys(response).forEach(element => {
                document.getElementById(element).innerText += response[element]
            });

            //Запрос на получение данных таблицы
            xhttp.open("GET", "http://localhost:3000/electrode", true)
            xhttp.setRequestHeader("Access-Control-Allow-Methods", '*')
            xhttp.setRequestHeader("Access-Control-Allow-Origin", 'http://localhost:3000')
            xhttp.send()

            //Ответ сервера
            xhttp.onreadystatechange = function() {
                let massCount = 0
                if (this.readyState == 4 && this.status == 200) {
                    response = JSON.parse(xhttp.responseText)

                    //Заполняем необходимые поля
                    response.forEach((item) =>{
                        const pasportDataArray = ['charge_type', 'charge_mark', 'index', 'fraction', 'mass', 'vshm', 'nv', 'o_content', 'fe_content', 'place_number', 'batch', 'manufacturer'] 
                        //Подготавливаем строку в таблице
                        let tr = document.createElement('tr')
                        let th = document.createElement('th')

                        th.scope = "row"
                        th.textContent = item[pasportDataArray[0]]
                        //Создаём иерархию в таблице
                        tr.appendChild(th)

                        

                        for (let index = 1; index < pasportDataArray.length; index++) {
                            const element = item[pasportDataArray[index]]
                            let th_element = document.createElement('th')
                            th_element.textContent = element
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
                        
                        massCount += Number(tr.children[4].textContent)
                        
                    })
                    document.getElementById("mass").textContent = massCount.toFixed() + " кг"
                }
            }
        }
    }
}

async function printPasport() {
    let doc = new jsPDF()
    let head = document.getElementById("head")
    let table = document.getElementById("table")
    const oldHeadStyle = head.style
    const oldTableStyle = table.style
    head.style.margin = 0
    head.style.width = table.style.width = '1112px'
    head.style.borderRadius = '0'
    table.style.borderRadius = '0'
    table.style.marginLeft = '0'
    table.style.marginRight = '0'
    let div = document.getElementById("print_tbl")
    div.style.backgroundColor = "#FFF"
    await html2canvas(div)
            .then(canvas => {
                let width = canvas.width
                let height = canvas.height

                doc.setPage(1)
                let dataURL = canvas.toDataURL('image/jpeg')
                console.log(dataURL);
                const scaler = .189
                doc.addImage(dataURL, 'JPEG', 0, 0, (width*scaler), (height*scaler) )
            })

    doc.save("pasport.pdf")
    head.style = oldHeadStyle
    table.style = oldTableStyle
}