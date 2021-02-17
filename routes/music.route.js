const express = require("express");
const router = express.Router();

router.get('/:id',(req, res) => {
    const id = +req.params.id || 1;
    res.render("../views/vwMusic/detailMusic.hbs");
});




module.exports = router;