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
const md5 = require("md5");

const DBUSER = [{
    ID: 1, email: 'abc@gmail.com', name: 'abc'
}, {
    ID: 2, email: 'abc1@gmail.com', name: 'abc1'
}]
router.get('/forget', (req, res) => {
    res.render('vwUser/forget')
})

router.post('/forget', (req, res) => {
    const {email} = req.body
    const user = DBUSER.find(x=>x.email==email)
    if (!user){
        return res.render('vwUser/forget',{error:{email:"Khong tim thay email"},model:{email}})
    }
    const randint = Math.floor(Math.random()*899999) + 100000
    user.forgetToken = md5(user.ID+ '|' + randint)
    // todo sendmail
    // abc.com/forget/user.forgetToken?pass=randint
    console.log(`/forget/${user.forgetToken}?pass=${randint}`)
    res.render('vwUser/forget',{success:{email}})
})

const forgetPasswordMiddleware = (req,res,next)=>{
    const {token} = req.params
    const {pass} = req.query
    const user = DBUSER.find(x=>x.forgetToken==token) || {}
    const hash = md5(user.ID+ '|' + pass)
    if (!user || token != hash) {
        return res.redirect('/login')
    }
    req.targetUser = user
    next()
}

router.get('/forget/:token',forgetPasswordMiddleware,(req,res)=>{
    res.render('vwUser/resetpassword')
})

router.post('/forget/:token',forgetPasswordMiddleware,(req,res)=>{
    const {p1,p2} = req.body
    if (p1 != p2) {
        return res.render('vwUser/resetpassword',{error:"Mat khau khong trung nhau"})
    }
    const user=req.targetUser
    user.password = p1
    user.forgetToken=''
    res.json(user)
})

module.exports = router;