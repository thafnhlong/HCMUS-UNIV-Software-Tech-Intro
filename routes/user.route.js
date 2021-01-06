const express = require("express");
const router = express.Router();

router.get('/register',(req,res) => {
    res.render("vwUser/register.hbs");
});

router.post('/register', async function (req, res){
    const userInDB = ["nguyenvana", "123", "Le Thi Cuc"];
    for (user of userInDB)
    {
        if (req.body.Username == user)
        {
            return res.render("vwUser/register.hbs", {err: true});
        }
    }
    var user = {
        userName: req.body.Username,
        Password: req.body.Password,
        Email: req.body.Email,
        Gender: req.body.gender,
        DOB: req.body.Birthday
    }
    console.log(user);
    res.send("Sent Email");
});

module.exports = router;