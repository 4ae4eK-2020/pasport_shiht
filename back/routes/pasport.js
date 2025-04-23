//const { CreatePasport } = require('../handlers/pasport/createPasport')
//const { DeletePasport } = require('../handlers/pasport/deletePasport')
const { ReadPasport } = require('../handlers/pasport/readPasport')
//const { UpdatePasport } = require('../handlers/pasport/updatePasport')

module.exports = function(fastify, opts, next) {
    //create Pasport
    /*fastify.route({
        method: 'POST',
        url: '/pasport',
        schema:{
            body: {
                type: 'object',
                properties: {
                    mass: { type: 'number' },
                    vshm: { type: 'number' },
                    nv: { type: 'number' },
                    place: { type: 'string' },
                    batch: { type: 'string'},
                    fraction: { type: 'string' },
                    pasport: { type: 'integer' },
                    manufacturer: { type: 'string' },
                    charge_mark: { type: 'string' },
                    charge_type: { type: 'string' },
                    Pasport_index: { type: 'string'},
                    o: { type: 'number' },
                    fe: { type: 'number' },
                },
                required: ['mass', 'vshm', 'nv', 'batch', 'pasport', 'manufacturer', 'charge_mark', 'charge_type', 'Pasport_index']
            },
        },
        async handler(request, reply) {
            const data = await CreatePasport(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()*/

    //read Pasport
    fastify.route({
        method: 'GET',
        url: '/pasport',
        schema:{
            querystring: {
                type: 'object',
                properties: {
                  id: { type: 'string' }
                },
                required: ['id']
              }
        },
        async handler(request, reply) {
            const data = await ReadPasport(request.query)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //update Pasport
    /*fastify.route({
        method: 'PUT',
        url: '/pasport',
        schema:{
            body: {
                type: 'object',
                properties: {
                    
                },
                required: []
            },
        },
        async handler(request, reply) {
            const data = await UpdatePasport(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //delete Pasport
    fastify.route({
        method: 'DELETE',
        url: '/pasport',
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
            const data = await DeletePasport(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()*/
}