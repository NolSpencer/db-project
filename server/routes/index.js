let { app } = require('../index.js');

app.use('/api', require('./api').router)