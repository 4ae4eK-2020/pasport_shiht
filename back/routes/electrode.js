const { CreateElectrode } = require('../handlers/electrode/createElectrode')
const { DeleteElectrode } = require('../handlers/electrode/deleteElectrode')
const { ReadElectrode } = require('../handlers/electrode/readElectrode')
const { UpdateElectrode } = require('../handlers/electrode/updateElectrode')

module.exports = function(fastify, opts, next) {
    //create electrode
    fastify.route({
        method: 'POST',
        url: '/electrode',
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
                    electrode_index: { type: 'string'},
                    o: { type: 'number' },
                    fe: { type: 'number' },
                },
                required: ['mass', 'vshm', 'nv', 'batch', 'pasport', 'manufacturer', 'charge_mark', 'charge_type', 'electrode_index']
            },
        },
        async handler(request, reply) {
            const data = await CreateElectrode(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //read electrode
    fastify.route({
        method: 'GET',
        url: '/electrode',
        schema:{},
        async handler(request, reply) {
            const data = await ReadElectrode(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //update electrode
    fastify.route({
        method: 'PUT',
        url: '/electrode',
        schema:{
            body: {
                type: 'object',
                properties: {
                    
                },
                required: []
            },
        },
        async handler(request, reply) {
            const data = await UpdateElectrode(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()

    //delete electrode
    fastify.route({
        method: 'DELETE',
        url: '/electrode',
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
            const data = await DeleteElectrode(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })
    
    next()
}