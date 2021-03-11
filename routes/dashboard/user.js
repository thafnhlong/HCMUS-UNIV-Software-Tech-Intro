const express = require("express");
const router = express.Router();

const isAdminMiddleware=(req,res,next)=>{
    if (res.locals.isAdmin)
        return next()
    res.redirect('back')
}

router.get('/',isAdminMiddleware, (req, res) => {
    res.render('dashboard/user/list')
});

router.get('/add',isAdminMiddleware, (req, res) => {
    res.send('add')
});

router.get('/:id/edit',isAdminMiddleware,(req,res,next)=>{
    //check exist
    res.send('edit')
});

module.exports = router;