const { Authorization } = require("../handlers/user/authorization")
module.exports = function(fastify, opts, next) {
    fastify.route({
        method: 'POST',
        url: '/user',
        schema:{
            body: {
                type: 'object',
                properties: {
                    login: { type : "string"},
                    password: { type: "string" },
                },
                required: ['login', 'password']
            }
        },
        async handler(request, reply) {
            const data = await Authorization(request.body)
            reply.status(data.statusCode)
            reply.header('Access-Control-Allow-Origin', 'http://127.0.0.1:5500')
            reply.send(data.message)
        }
    })
    
    next()
}