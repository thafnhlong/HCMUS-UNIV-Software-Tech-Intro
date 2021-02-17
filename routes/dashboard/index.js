const express = require("express");
const router = express.Router();

router.use((req,res,next)=>{
  if (res.locals.lcIsAuthenticated){
    return next()
  }
  res.redirect('/login')
})

router.use(require('./profile'))

module.exports = router;
