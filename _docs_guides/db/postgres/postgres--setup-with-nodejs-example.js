/**************************************************************************************************
*
*       Standalone script that creates a postgres client. 
*
*/

const Pool = require('pg').Pool;

const config = {
    host: 'localhost',
    user: 'postgres',
    //password: 'bar',
    database: 'test-db', // << CHANGE THIS TO YOUR DB NAME
};

// handle errors
process.on('unhandledRejection', function(e) {
    console.log(e.message, e.stack);
});

// create the pool somewhere globally so its lifetime lasts as long as your app is running
const pgPool = new Pool(config)
    pgPool.query('INSERT INTO visit (date) VALUES ($1)', [new Date()], function(err) {
        if (err) return onError(err);
        // get the total number of visits today (including the current visit)
        pgPool.query('SELECT COUNT(date) AS count FROM visit', function(err, result) {
            // handle an error from the query
            if (err) return onError(err);
            console.log('You are visitor number ' + result.rows[0].count);
        });
    });

// Execute a mutative query
pgPool
    .query('CREATE TABLE IF NOT EXISTS visit (date timestamptz)')
    .then(function(data) {
        console.log(`data:`, data); // doesn't really give any data, but it's worth seeing I guess.
    })
