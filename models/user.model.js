const db = require("../utils/dao");

const TBL_USER = "USERS"
module.exports = {
    add: function(user){
        return db.add(TBL_USER, user);
    }
};