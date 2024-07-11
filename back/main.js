require('dotenv').config();

const autoload = require('@fastify/autoload');
const path = require('path');
const cors = require('@fastify/cors');
const { sign } = require('crypto');
const authMidleware = require('./midlewares/auth');
const fastify = require('fastify')({
    logger: true,
});
fastify.register(autoload, {
    dir: path.join(__dirname, './routes'),
});
fastify.register(cors, {
    origin: (origin, callback) => {
        const hostName = new URL(origin).hostname
        if(hostName === "localhost") {
            callback(null, true)
            return
        }
    }
})

fastify.addHook('preHandler', authMidleware)

fastify.register(require('@fastify/jwt'), {
    secret: process.env.SECRET_KEY,
    sign: {
        expiresIn: '30min'
    }
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