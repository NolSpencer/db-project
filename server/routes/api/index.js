let express = require('express');
let path = require('path');
let router = express.Router();
exports.router = router;
router.get('/hi', (req,res)=>{
    res.send('hi chris')
})
router.get('/pets.json', (req, res) => {
    mysql.query('SELECT * from pet', function(err, results) {
      if (err) {
        throw err;
      } else {
        res.json(results);
      }
    })
});
router.get('/pet/:id/image', (req, res) => {
    mysql.query('SELECT imagepath From pictures where pet_id = ?', [req.params.id], function(err, results){
        if (err) {
            throw err;
          } else {
            let result = results[0];
            res.sendFile(path.resolve(__dirname + '../../../../pictures/' + result.imagepath));
          }
    })
});
router.get('/facilities.json', (req, res) => {
    mysql.query('SELECT * from location', function(err, results) {
      if (err) {
        throw err;
      } else {
        res.json(results);
      }
    })
});