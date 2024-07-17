//Вешаем обработчик событий после загрузки DOM-дерева
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById("enter").onclick = enter
})

//Собиаем данные с формы и отправляем их на сервер. Если всё хорошо, то пропускаем дальше
function enter() {
    let login = document.getElementById("log").value
    let password = document.getElementById("pass").value
    const xhttp = new XMLHttpRequest()
    
    const data = new Object({
        login: login,
        password: password
    })

    xhttp.open("POST", "http://localhost:3000/user", true)
    xhttp.setRequestHeader("Access-Control-Allow-Methods", '*')
    xhttp.setRequestHeader("Access-Control-Allow-Origin", 'http://localhost:3000')
    xhttp.setRequestHeader("Content-type", 'application/json')
    xhttp.send(JSON.stringify(data))

    xhttp.onreadystatechange = function() {
        if (this.readyState == 4) {
            if(this.responseText == "success") {    
                window.location.replace('./index.html')
            } else {
                alert('Uncorrect login or password. Try again!')
                login.value = ""
                password.value = ""
            }
        }
    }
}