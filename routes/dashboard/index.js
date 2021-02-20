const express = require("express");
const router = express.Router();

const authenMiddleware =(req,res,next)=>{
  console.log('hit')
  if (res.locals.lcIsAuthenticated){
    return next()
  }
  res.redirect('/login')
}

router.use('/profile',authenMiddleware,require('./profile'))

module.exports = router;
