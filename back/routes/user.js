const { Authorization } = require("../handlers/user/authorization")
module.exports = function(fastify, opts, next) {
    fastify.route({
        method: 'POST',
        url: '/user',
        schema:{
            body: {
                type: 'object',
                properties: {

                }
            }
        },
        async handler(request, reply) {
            const data = await Authorization(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()
}