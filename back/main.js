require('dotenv').config();

const autoload = require('@fastify/autoload');
const path = require('path');
//const cors = require('cors') *Удалить библиоткеку и поставить npm i @fastify/cors*
const fastify = require('fastify')({
    logger: true,
});
fastify.register(autoload, {
    dir: path.join(__dirname, './routes'),
});
/*fastify.register(cors, {
    origin: (origin, callback) => {
        const hostName = new URL(origin).hostname
        if(hostName === "localhost") {
            callback(null, true)
            return
        }
    }
})*/

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