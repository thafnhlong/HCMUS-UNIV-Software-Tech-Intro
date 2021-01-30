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
    },

    // get data
    singleByUserNameorEmail: async function (username) {
        const rows = await db.load(`select * from ${TBL_USER} where username = '${username}' or email = '${username}'`);
        if (rows.length === 0)
            return null;
        return rows[0];
    },
    //check username
    checkExistAccount: async function(username){
        const result = await db.load(`SELECT * FROM ${TBL_USER} WHERE username = '${username} or email = '${username}'`);
        return result.length > 0;
    },

    // active account

    // get otp 
    singleOtp: async function (username, email) {
        const rows = await db.load(`select otpverify from ${TBL_USER} where username = '${username}' or email = '${email}'`);
        if (rows.length === 0)
            return null;
        return rows[0];
    }
}