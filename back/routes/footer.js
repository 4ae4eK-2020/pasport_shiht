const { ReadFooter } = require('../handlers/footer/readFooter')

module.exports = function(fastify, opts, next) {
    //read Footer
    fastify.route({
        method: 'GET',
        url: '/footer',
        schema:{},
        async handler(request, reply) {
            const data = await ReadFooter(request.body)
            reply.status(data.statusCode)
            reply.send(data.message)
        }
    })

    next()
}