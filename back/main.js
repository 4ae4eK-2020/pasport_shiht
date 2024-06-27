const autoload = require('@fastify/autoload')
const path = require('path')
//require('dotenv').config()
const fastify = require('fastify')

const app = fastify()

app.register(autoload, {
    dir: path.join(__dirname, 'routes')
})

app.listen({host: "localhost", port: /*process.env.PORT*/3000}, function (err, address) {
    if (err) {
        console.error(err)
        process.exit(1)
    } else {
        console.log(`Server started at: ${"localhost"/*process.env.HOST*/}:${3000/*app.port*/}`)
    }
})