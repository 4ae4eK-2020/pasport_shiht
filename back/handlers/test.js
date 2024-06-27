const Pool = require("pg-pool")

async function Test(object) {
    const data = {
        message: 'error',
        statusCode: 400
    }

    const funcName = "Test"

    const client = Pool.connect()

    try {
        data.message = "test complieted"
        data.statusCode = 200
    } catch (error) {
        console.error(error)
    } finally {
        client.release()
    }

    return data
}

module.exports = {
    Test: Test
}