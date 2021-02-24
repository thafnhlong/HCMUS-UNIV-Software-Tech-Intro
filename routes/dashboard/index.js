const express = require("express");
const router = express.Router();

const authenMiddleware =(req,res,next)=>{
  if (res.locals.lcIsAuthenticated){
    return next()
  }
  res.redirect('/login')
}

router.use('/profile',authenMiddleware,require('./profile'))
router.use('/category',authenMiddleware,require('./category'))

module.exports = router;
