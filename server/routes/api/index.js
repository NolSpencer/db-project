let express = require('express');
let router = express.Router();
exports.router = router;
router.get('/hi', (req,res)=>{
    res.send('hi chris')
})
app.get('/select/data/from/table', (req, res) => {
    connection.query('SELECT * from thing', function(err, results) {
      if (err) {
        throw err;
      } else {
        res.json(results);
      }
    })
});