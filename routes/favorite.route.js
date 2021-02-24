const express = require("express");
const router = express.Router();

router.get('/', (req, res) => {
    res.render('../views/vwMusic/favorite.hbs')
});






module.exports = router;