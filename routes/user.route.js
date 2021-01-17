const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const md5 = require("md5");
const UserModel = require("../models/user.model");
const Helper = require("../utils/helper");
const config = require("../config/default.json");

router.get('/register',(req,res) => {
    res.render("vwUser/register.hbs");
});

router.post('/checkInfo', async (req,res) => {
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
    if (await UserModel.checkExistEmail(Data.data.Email))        
        return res.status(200).send({Exist: Exist, err: 0});
    
    //Check username
    if (await UserModel.checkExistUsername(Data.data.Username))       
        return res.status(200).send({Exist: Exist, err: 1});
    Exist = false;
    res.status(200).send(Exist);
});

router.post('/register', async function (req, res){
    var passwordHash = bcrypt.hashSync(req.body.Password, config.authentication.saltRounds);
    var token = Math.floor(100000 + Math.random() * 900000);
    var getDateTimeNow = Helper.ConverDateTime(new Date());
    var user = {
        userName: req.body.Username,
        Password: passwordHash,
        Email: req.body.Email,
        Gender: req.body.gender,
        permision: 0,
        delete: 0,
        status: 0,
        createDate: getDateTimeNow,
        modifileDate: getDateTimeNow,
        DOB: req.body.Birthday,
        activeToken: token
    }
    // Lưu user xuống db
    await UserModel.add(user);
    // Sendmail(user.Email, user.Token)
    console.log(user);
    res.render("vwUser/register.hbs", {Email: req.body.Email, Success: true});
});

router.get('/active', async function (req, res){
    const token = +req.query.token || -1;
    const rs = await UserModel.activeAccount(token);
    if (rs.changedRows > 0)
    {
        return res.send("Active Success");
    }
    res.send("Active Failed");
    
});

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