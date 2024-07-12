require('dotenv').config();
const fastifyJwt = require('@fastify/jwt')
const fp = require('fastify-plugin')

async function auth(fastify, opts, next) {
    fastify.register(fastifyJwt, {
        secret: process.env.SECRET_KEY,
        sign: {
            expiresIn: '30min'
        }
    })
    fastify.decorate('authenticate', async function (request, reply) {
        try {
            const token = request.headers.Accept
            await request.jwtVerify(token)
        } catch (err) {
            console.log(err.name, err.stack)
            reply.send(err)
        }
    })
}

module.exports = fp(auth, { fastify: '>=1.0.0' })