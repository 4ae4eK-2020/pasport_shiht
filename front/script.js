document.getElementById("enter").onclick = enter

function enter() {
    let login = document.getElementById("log").value
    let password = document.getElementById("pass").value
    const xhttp = new XMLHttpRequest()

    xhttp.onload = () => {
        xhttp.open("POST", "localhost:3000/user")
    }

    if(login == "admin" && password =="1234") {
        window.location.replace("./index.html")
    } else {
        alert("uncorrect login or password. Try again")
        login.value = ""
        password.value = ""
    }
}