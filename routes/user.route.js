const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const md5 = require("md5");

const UserModel = require('../models/user.model');
const Helper = require("../utils/helper");
const config = require("../config/default.json");
const mailer = require("../misc/mailer");

router.get('/register',(req,res) => {
    res.render("vwUser/register.hbs");
});

router.post('/register/checkinfo', async (req,res) => {
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
    // Sendmail
    var linkActive = `http://localhost:3000/active?token=${user.activeToken}`;
    mailer.sendActiveToken(user.Email, linkActive);
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


router.get('/forget', (req, res) => {
    res.render('vwUser/forget')
})

router.post('/forget', (req, res, next) => {
    const {email} = req.body
    let randint,forgetToken
    UserModel.getByEmai(email)
        .then(users=>{
            if (users.length == 0){
                return res.render('vwUser/forget',{error:{email:"Khong tim thay email"},model:{email}})
            }
            const user = users[0]
            randint = Math.floor(Math.random()*899999) + 100000
            forgetToken = md5(user.ID+ '|' + randint)

            UserModel.setForgetToken(forgetToken,user.ID)
            return mailer.sendForgetToken(user.email,`${config.site.url}/forget/${forgetToken}?pass=${randint}`)
        })
        .then(response=>{
            console.log('Email response:', response)
            console.log(`/forget/${forgetToken}?pass=${randint}`)
            res.render('vwUser/forget',{success:{email}})
        })
        .catch(next)
})

const forgetPasswordMiddleware = (req,res,next)=>{
    const {token} = req.params
    const {pass} = req.query
    UserModel.getByForgetToken(token).then(response=>{
        const user = response[0] || {}
        const hash = md5(user.ID+ '|' + pass)
        if (!user || token != hash) {
            return res.redirect('/login')
        }
        req.targetUser = user
        next()
    }).catch(next)
}

router.get('/forget/:token',forgetPasswordMiddleware,(req,res)=>{
    res.render('vwUser/resetpassword')
})

router.post('/forget/:token',forgetPasswordMiddleware,(req,res,next)=>{
    const {p1,p2} = req.body
    if (p1 != p2) {
        return res.render('vwUser/resetpassword',{error:"Mat khau khong trung nhau"})
    }

    var passwordHash = bcrypt.hashSync(req.body.p1, config.authentication.saltRounds);

    const id = req.targetUser.ID
    const updateUser = {refreshToken:null,password:passwordHash,modifileDate:new Date()}
    UserModel.patch(updateUser,id).then(()=>res.redirect('/login')).catch(next)
})

router.get('/login', function (req, res) {

  res.render('vwUser/login')
})
router.post('/login', async function(req, res){
  const user=await UserModel.singleByUserNameorEmail(req.body.username);
  if(user===null){
    return res.render('vwUser/login',{
      err: 'Invalid username or password.'
    })
  }
  const rs = bcrypt.compareSync(req.body.password, user.password);
  if (rs === false) {
    return res.render('vwUser/login', {
      err: 'Invalid username or password.'
    })
  }
  if(user.status===0){
    res.redirect('/Active');
  }
  delete user.HashPassword;
  req.session.isAuthenticated = true;
  req.session.authUser = user;

  const url = req.query.retUrl || '/';
  res.redirect(url);
})

module.exports = router;