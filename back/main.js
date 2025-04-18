require('dotenv').config();

const autoload = require('@fastify/autoload');
const path = require('path');
const cors = require('@fastify/cors');
const auth = require('./midlewares/auth');
const fastify = require('fastify')({
    logger: {
        redact: ["headers.authorization"],
        level: "info",
    },
});
fastify.register(autoload, {
    dir: path.join(__dirname, './routes'),
});
fastify.register((fastify, opts, next) => {
    fastify.register(cors, {
        origin: "http://localhost:5501",
        methods: ["POST", "GET", "PUT", "DELETE"],
    })  
    next()
})

fastify.addHook('onRequest', async (request, reply) => {
    reply.header("Access-Control-Allow-Origin", "http://localhost:5501")
})

fastify.register(auth)

fastify.register(async (fastify, opts) => {
    fastify.addHook('onRequest', fastify.authenticate)
})

const start = async () => {
    try {
        await fastify.listen({ port: process.env.H_PORT, host: process.env.H_IP });
        console.log(`start server on ${ process.env.H_IP }:${ process.env.H_PORT } success`);
    }
    catch (err) {
        console.log('start_server_error', err);
        process.exit(1);
    }
};

start();