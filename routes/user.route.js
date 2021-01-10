const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
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