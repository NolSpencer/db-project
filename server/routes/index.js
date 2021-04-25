const e = require('express');
let { app } = require('../index.js');

app.get('/logout', (req, res) => {
    req.session.destroy(function(err) {
        if(err){
            res.send(err.message);
        } else {
            res.redirect('/login');
        }
      })
});

app.get('/session', (req, res) => res.json(req.session))

app.use('/api', require('./api').router)