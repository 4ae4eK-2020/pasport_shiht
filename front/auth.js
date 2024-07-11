//Вешаем обработчик событий после загрузки DOM-дерева
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById("enter").onclick = enter
})

//Собиаем данные с формы и отправляем их на сервер. Если всё хорошо, то пропускаем дальше
function enter() {
    let login = document.getElementById("log").value
    let password = document.getElementById("pass").value
    const xhttp = new XMLHttpRequest()
    
    xhttp.open("POST", "http://localhost:3000/user", true)
    xhttp.setRequestHeader("Access-Control-Allow-Methods", '*')
    xhttp.setRequestHeader("Access-Control-Allow-Origin", 'http://localhost:3000')
    xhttp.setRequestHeader("Access-Control-Allow-Headers", 'Content-Type')
    xhttp.setRequestHeader("Content-Type", 'application/json')
    xhttp.send(`name=${login}&password=${password}`)

    if(xhttp.responseText == "success") {
        window.location.replace("./index.html")
    } else {
        alert("uncorrect login or password. Try again")
        login.value = ""
        password.value = ""
    }
}