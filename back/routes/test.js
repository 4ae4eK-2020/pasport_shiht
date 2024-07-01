const { Test } = require('../handlers/test')
module.exports = function(fastify, opts, next) {
    fastify.route({
        method: 'GET',
        url: '/',
        schema:{
            querystring: {
                name: {type: 'string'}
            },
            response: {
                200: {
                    type: 'object',
                    properties: {
                        test: {type: 'string'}
                    }
                }
            }
        },
        async handler(request, reply) {
            const data = await Test(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()
}