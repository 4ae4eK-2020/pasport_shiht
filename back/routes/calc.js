const { CreateCalc } = require('../handlers/calc/createCalc')
const { DeleteCalc } = require('../handlers/calc/deleteCalc')
const { ReadCalc } = require('../handlers/calc/readCalc')
const { UpdateCalc } = require('../handlers/calc/updateCalc')

module.exports = function(fastify, opts, next) {
    //create Calc
    fastify.route({
        method: 'POST',
        url: '/calc',
        schema:{
            body: {
                type: 'object',
                properties: {
                    al: { type: 'number' },
                    mo: { type: 'number' },
                    v: { type: 'number' },
                    c: { type: 'number' },
                    cr: { type: 'number' },
                    ntc: { type: 'string' },
                    directive: { type: 'string' },
                },
                required: ['ntc', 'directive']
            },
        },
        async handler(request, reply) {
            const data = await CreateCalc(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //read calc
    fastify.route({
        method: 'GET',
        url: '/calc',
        schema:{},
        async handler(request, reply) {
            const data = await ReadCalc(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //update calc
    fastify.route({
        method: 'PUT',
        url: '/calc',
        schema:{
            body: {
                type: 'object',
                properties: {
                    id: { type: 'integer' },
                    al: { type: 'number' },
                    mo: { type: 'number' },
                    v: { type: 'number' },
                    c: { type: 'number' },
                    cr: { type: 'number' },
                    ntc: { type: 'string' },
                    directive: { type: 'string' },
                },
                required: ['id', 'ntc', 'directive']
            },
        },
        async handler(request, reply) {
            const data = await UpdateCalc(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //delete calc
    fastify.route({
        method: 'DELETE',
        url: '/calc',
        schema:{
            body: {
                type: 'object',
                properties: {
                    id: {type: 'integer' }
                },
                required: ['id']
            },
        },
        async handler(request, reply) {
            const data = await DeleteCalc(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()
}