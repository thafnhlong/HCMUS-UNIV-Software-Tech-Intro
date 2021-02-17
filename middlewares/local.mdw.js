const userModel = require("../models/user.model");

module.exports = function (app) {
    app.use(function (req, res, next) {
        if (req.session.authUser){
            userModel.getByID(req.session.authUser.ID).then(resp=>{
                if (resp.length > 0){
                    res.locals.lcAuthUser = resp[0] 
                    res.locals.lcIsAuthenticated = true;
                } else 
                    delete req.session.authUser
                next();
            })
            .catch(next)
        }
        else next()
    })
}