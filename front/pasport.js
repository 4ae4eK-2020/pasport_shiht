let formId = 1

function handleFormChange(select) {
    setCookie("selectedForm", select.value, 7);
    console.log("Выбрана форма:", select.value);
  }

  document.addEventListener("DOMContentLoaded", () => {
    const savedForm = getCookie("selectedForm");
    const select = document.getElementById("formSelect");

    if (savedForm) {
        select.value = savedForm;
        loadPassport(savedForm); // загружаем только если значение есть
    }

    select.addEventListener("change", function () {
        const formId = this.value;
        setCookie("selectedForm", formId, 7); // не забудь обновить куку
        loadPassport(formId); // загружаем выбранную форму
    });

    document.getElementById("print_btn").onclick = printPasport;
});


function loadPassport(_formId) {
    const pasportFields = ['charge_type', 'charge_mark', 'index', 'fraction', 'mass', 'vshm', 'nv', 'o_content', 'fe_content', 'place_number', 'batch', 'manufacturer']
    pasportFields.forEach(id => {
        const el = document.getElementById(id);
        if (el) el.innerText = "";
    });

    document.getElementById("request_number").innerHTML = "Паспорт № ";
    document.getElementById("pasport_footer").innerHTML = "";

    const xhttp = new XMLHttpRequest()

    // === 1. Получаем данные паспорта ===
    xhttp.open("GET", `http://localhost:3000/pasport?id=${_formId}`, true)
    xhttp.onload = function() {
        if (this.status == 200) {
            let response = JSON.parse(xhttp.responseText.substring(1, xhttp.responseText.length-1))
            Object.keys(response).forEach(element => {
                document.getElementById(element).innerText += response[element]
            })

            // === 2. После успешного получения паспорта — получаем таблицу ===
            loadElectrode()
        }
    }
    xhttp.send()

    // === 3. Получаем данные подвала независимо от паспорта и таблицы ===
    loadFooter()
}

function loadElectrode() {
    const xhttp = new XMLHttpRequest()
    xhttp.open("GET", "http://localhost:3000/electrode", true)
    xhttp.onload = function() {
        if (this.status == 200) {
            let response = JSON.parse(xhttp.responseText)
            let massCount = 0
            response.forEach((item) => {
                const pasportDataArray = ['charge_type', 'charge_mark', 'index', 'fraction', 'mass', 'vshm', 'nv', 'o_content', 'fe_content', 'place_number', 'batch', 'manufacturer']
                let tr = document.createElement('tr')
                let th = document.createElement('th')
                th.scope = "row"
                th.textContent = item[pasportDataArray[0]]
                tr.appendChild(th)

                for (let index = 1; index < pasportDataArray.length; index++) {
                    const element = item[pasportDataArray[index]]
                    let th_element = document.createElement('th')
                    th_element.textContent = element
                    tr.appendChild(th_element)
                }

                document.getElementById("pasport_table").appendChild(tr)
                massCount += Number(tr.children[4].textContent)
            })
            document.getElementById("mass").textContent = massCount.toFixed() + " кг"
        }
    }
    xhttp.send()
}

function loadFooter() {
    const xhttp = new XMLHttpRequest()
    xhttp.open("GET", "http://localhost:3000/footer", true)
    xhttp.onload = function() {
        if (this.status == 200) {
            let response = JSON.parse(xhttp.responseText)
            response.forEach((item) => {
                const pasportDataArray = Object.keys(item)
                let tr = document.createElement('tr')
                let th = document.createElement('th')
                let date = new Date(item[pasportDataArray[0]])
                th.textContent = format(date)
                tr.appendChild(th)
                for (let index = 1; index <= pasportDataArray.length; index++) {
                    const element = item[pasportDataArray[index]]
                    let th_element = document.createElement('th')
                    th_element.textContent = element
                    tr.appendChild(th_element)
                }
                for (let i = 0; i < 3; i++) {
                    let th = document.createElement('th')
                    tr.appendChild(th)
                }
                document.getElementById("pasport_footer").appendChild(tr)
            })
        }
    }
    xhttp.send()
}

function format(date) {
    var d = date.getDate();
    var m = date.getMonth() + 1;
    var y = date.getFullYear();
    return '' + (d <= 9 ? '0' + d : d) + '-' + (m<=9 ? '0' + m : m) + '-' + y;
}

function printPasport() {
    const printArea = document.querySelector('[print_type="1"]');

    // Убираем все элементы, которые не являются частью выделенной области для печати
    const allElements = document.body.querySelectorAll('*');
    allElements.forEach(el => {
        if (!el.closest('[print_type="1"]')) {
            el.style.display = 'none';
        }
    });

    // Применяем стили для печати
    const style = document.createElement('style');
    style.innerHTML = `
        @media print {
            body {
                margin: 0;
                padding: 0;
            }
            html, body {
                width: 100%;
                height: 100%;
            }
            @page {
                margin: 0;
            }
            .header, .footer, .navigation {
                display: none;
            }
            .print-header, .print-footer {
                display: none;
            }
        }
    `;
    document.head.appendChild(style);

    // Печать содержимого
    window.print();

    // Ожидаем, пока окно печати откроется, затем восстанавливаем исходное состояние
    setTimeout(() => {
        document.head.removeChild(style);
        window.location.reload();
    }, 500);
}

function setCookie(name, value, days) {
    const d = new Date();
    d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000)); // Срок жизни куки
    const expires = "expires=" + d.toUTCString();
    document.cookie = name + "=" + value + ";" + expires + ";path=/"; // Устанавливаем куку
}

function getCookie(name) {
    const decodedCookie = decodeURIComponent(document.cookie);
    const cookies = decodedCookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
      let c = cookies[i];
      while (c.charAt(0) === ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) === 0) {
        return c.substring(name.length + 1, c.length);
      }
    }
    return "";
}