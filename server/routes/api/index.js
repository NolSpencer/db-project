let express = require('express');
let path = require('path');
let bcrypt = require('bcrypt');
let router = express.Router();
const saltRounds = 10;
exports.router = router;
router.get('/hi', (req, res) => {
    res.send('hi chris')
})
router.get('/pets.json', (req, res) => {
    mysql.query(`SELECT pet.id,pet.petname,type.typedescription,breed.breedname,pet.age,pet.petdescription,pet.weight,pet.size,pet.acquisitiondate,pet.sp_neu,location.facilityname 
        FROM pet,location,breed,type 
        WHERE pet.type_id = type.id AND pet.breed_id = breed.id AND pet.location_id = location.id`
        , function (err, results) {
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
    let data = await new Promise(function (resolve, reject) {
        mysql.query(`SELECT email, password FROM contact WHERE email = ?`,
            [
                req.body.email
            ]
            , function (err, results) {
                if (err) {
                    reject(err);
                } else {
                    resolve(results[0]);
                }
            });
    });
    const match = await bcrypt.compare(req.body.password, data.password);
    if (match) {
        req.session.user = data.email;
        req.session.email = data.email;
        res.send(true);
    } else {
        res.send(false);
    }
});
router.post('/adoptionrecords', express.json(), (req, res) => {
    var money = '$250';
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy + '/' + mm + '/' + dd;

    mysql.query(`INSERT INTO adoption (adopt_date, adopt_fee, contact_id, pet_id) VALUES (?,?,(SELECT id FROM contact where email = ?), ?);`,
        [
            today,
            money,
            req.session.email,
            req.body.id
        ],
        function (err, results) {
            if (err) {
                throw err;
            } else {
                res.json(results);
            }
        })
});
router.get('/records.json', (req, res) => {
    mysql.query(`SELECT adoption.id,adoption.adopt_date,adoption.adopt_fee,contact.email,pet.petname FROM contact,pet,adoption WHERE contact_id = contact.id AND pet_id = pet.id`, function (err, results) {
        if (err) {
            throw err;
        } else {
            res.json(results);
        }
    })
});
router.post('/deleteaccount', express.json(), async (req, res) => {
    let data = await new Promise(function (resolve, reject) {
        mysql.query(`SELECT email, password FROM contact WHERE email = ?`,
            [
                req.body.email
            ]
            , function (err, results) {
                if (err) {
                    reject(err);
                } else {
                    resolve(results[0]);
                }
            });
    });
    const match = await bcrypt.compare(req.body.password, data.password);
    if (match) {
        mysql.query(`DELETE FROM contact WHERE email = ?`,[req.body.email], function (err, results) {
            if (err) {
                throw err;
            } else {
                res.json(results);
            }
        })
        res.send(true);
    } else {
        res.send(false);
    }
});