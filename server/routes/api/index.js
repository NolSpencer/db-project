let express = require('express');
let path = require('path');
let bcrypt = require('bcrypt');
const e = require('express');
let router = express.Router();
const saltRounds = 10;
exports.router = router;
router.get('/hi', (req, res) => {
    res.send('hi chris')
})
router.get('/pets.json', (req, res) => {
    mysql.query('SELECT * from pet', function (err, results) {
        if (err) {
            throw err;
        } else {
            res.json(results);
        }
    })
});
router.get('/pet/:id/image', (req, res) => {
    mysql.query('SELECT imagepath From pictures where pet_id = ?', [req.params.id], function (err, results) {
        if (err) {
            throw err;
        } else {
            let result = results[0];
            res.sendFile(path.resolve(__dirname + '../../../../pictures/' + result.imagepath));
        }
    })
});
router.get('/facilities.json', (req, res) => {
    mysql.query('SELECT * from location', function (err, results) {
        if (err) {
            throw err;
        } else {
            res.json(results);
        }
    })
});
router.post('/signup', express.json(), (req, res) => {
    bcrypt.genSalt(saltRounds, function (err, salt) {
        bcrypt.hash(req.body.password, salt, function (err, hash) {
            mysql.query(`INSERT INTO contact (firstname,lastname,phone_no,email,addr1,addr2,city,state,zip,password) VALUES (?);`,
            [
                [
                    req.body.firstname,
                    req.body.lastname,
                    req.body.phone_no,
                    req.body.email,
                    req.body.addr1,
                    req.body.addr2,
                    req.body.city,
                    req.body.state,
                    req.body.zip,
                    hash
                ]
            ],
                function (err, results) {
                    if (err) {
                        throw err;
                    } else {
                        res.json(results);
                    }
                })
        });
    });
});

router.post('/login', express.json(), async (req, res) => {
    let data = await new Promise(function(resolve, reject) {
        mysql.query(`SELECT email, password FROM contact WHERE email = ?`,
        [
            req.body.email
        ]
        , function(err, results) {
          if (err) {
            reject(err);
          } else {
                resolve(results[0]);
          }
        });
       });
    const match = await bcrypt.compare(req.body.password, data.password);
    if(match) {
        req.session.user = req.body.email;
        res.send(true);
    } else{
        res.send(false);
    }
});
