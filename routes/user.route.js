const express = require("express");
const router = express.Router();

router.get('/register',(req,res) => {
    res.render("vwUser/register.hbs");
});

router.post('/checkUsername',(req,res) => {
    const userInDB = ["nguyenvana", "123", "Le Thi Cuc"];
    var Exist = true;
    for (user of userInDB)
    {
        if (req.body.username == user)
        {
            //return res.render("vwUser/register.hbs", {err: true});            
            return res.status(200).send(Exist);
        }
    }
    Exist = false;
    res.status(200).send(Exist);
});

router.post('/register', async function (req, res){
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