const authMidleware = async (request, reply) => {
    try {
        let decoded = await request.jwtVerify()
        if(!decoded) {
            reply.send({
                message: 'Token is not valid',
                statusCode: 401
            })
        }
        request.jwtPayload = decoded
    } catch (err) {
        reply.status(403).send({ message: 'verify error: ' + err.message})
    }
}

module.exports = authMidleware