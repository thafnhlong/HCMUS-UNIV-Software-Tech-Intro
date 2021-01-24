const db = require("../utils/dao");

const TBL_USER = "Users"
module.exports = {
    add: function(user){
        return db.add(TBL_USER, user);
    },
    getByEmai: async (email) => {
        return db.load(`SELECT * FROM ${TBL_USER} WHERE email = '${email}'`);
    },
    setForgetToken: async (token,id) => {
        return db.patch(TBL_USER,{refreshToken:token},{ID:id})
    },
    getByForgetToken: async (token) => {
        return db.load(`SELECT * FROM ${TBL_USER} WHERE refreshToken = '${token}'`);
    },
    patch: async (entity,id) => {
        delete entity.ID
        return db.patch(TBL_USER,entity,{ID:id})
    },
    checkExistUsername: async function(userName){
        const result = await db.load(`SELECT * FROM ${TBL_USER} WHERE userName = '${userName}'`);
        return result.length > 0;
    },
    checkExistEmail: async function(Email){
        const result = await db.load(`SELECT * FROM ${TBL_USER} WHERE email = '${Email}'`);
        return result.length > 0;
    },
    activeAccount: function(token){
        const condition  = {
            activeToken: token
        };
        const entity = {
            activeToken: null,
            status: 1
        }
        return db.patch(TBL_USER, entity, condition);
    }
};