const express = require("express");
const bcrypt = require('bcrypt')
const config = require('../../config/default.json')
const userModel = require("../../models/user.model");
const router = express.Router();

const changePassword = async (req,res) => {
    const {cpass,npass,vpass} = req.body
    if (!npass || !vpass || npass != vpass){
        return {errorMsg: "New password is invalid or mismatched"}
    }
    const rs = bcrypt.compareSync(cpass, res.locals.lcAuthUser.password);
    if (rs === false) {
        return {errorMsg: "Current password is invalid"}
    }
    var passwordHash = bcrypt.hashSync(npass, config.authentication.saltRounds);

    return userModel.patch({password:passwordHash},res.locals.lcAuthUser.ID)
    .then(()=>({succMsg:'Password changed successfully'}))
}

router.get("/profile", (req, res) => {
  res.render('dashboard/profile')
});

router.post("/profile", (req,res,next)=>{
    const data={method:req.query.method}
    switch (req.query.method){
        case 'password':
            changePassword(req,res).then(resp=>{
                res.render('dashboard/profile',{...data,...resp})
            }).catch(next)
            break
        default:
            res.redirect('back')
    }
})
module.exports = router;