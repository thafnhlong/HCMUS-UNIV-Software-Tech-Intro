const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const config = require("../config/default.json");

router.get('/register',(req,res) => {
    res.render("vwUser/register.hbs");
});

router.post('/checkInfo',(req,res) => {
    const UsernameInDB = ["nguyenvana", "123", "Le Thi Cuc"];
    const EmailInDB = ["nguyenvanb", "1234", "Le Thi Cuc1"];
    var Data;
    try{
      Data = JSON.parse(req.body.Data);
    }
    catch (error)
    {
      return res.send(error.message);
    }

    var Exist = true;
    //Check mail
    for (mail of EmailInDB)
    {
        if (Data.data.Email == mail)
        {              
            return res.status(200).send({Exist: Exist, err: 0});
        }
    }
    
    //Check username
    for (username of UsernameInDB)
    {
        if (Data.data.Username == username)
        {            
            return res.status(200).send({Exist: Exist, err: 1});
        }
    }
    Exist = false;
    
    res.status(200).send(Exist);
});

router.post('/register', async function (req, res){
    var passwordHash = bcrypt.hashSync(req.body.Password, config.authentication.saltRounds);
    var token = Math.floor(100000 + Math.random() * 900000);
    var user = {
        userName: req.body.Username,
        Password: passwordHash,
        Email: req.body.Email,
        Gender: req.body.gender,
        DOB: req.body.Birthday,
        Token: token
    }
    // Lưu user xuống db
    // gửi mail kích hoạt tài khoản
    console.log(user);
    res.render("vwUser/register.hbs", {Email: req.body.Email, Success: true});
});

module.exports = router;