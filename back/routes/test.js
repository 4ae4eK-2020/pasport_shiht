const { Test } = require('../handlers/test')
const fastify = require("fastify");

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
    handler: async function (request, reply) {
        const data = await Test()
        reply.statusCode = data.statusCode
        reply.send(data.message)
    }
})

next()