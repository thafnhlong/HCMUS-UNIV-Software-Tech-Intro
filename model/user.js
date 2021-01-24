const db=require('../utils/dao');
const TBL_USER='users';
module.exports={
    // get data
    singleByUserName: async function (username) {
        const rows = await db.load(`select * from ${TBL_USER} where UserName = '${username}'`);
        if (rows.length === 0)
            return null;

        return rows[0];
    },
    // get data
    singleByUserNameorEmail: async function (username) {
        const rows = await db.load(`select * from ${TBL_USER} where UserName = '${username}' or EmailAdress = '${username}'`);
        if (rows.length === 0)
            return null;
        return rows[0];
    },
    //check username
    checkExistAccount: async function(userName){
        const result = await db.load(`SELECT * FROM ${TBL_USER} WHERE userName = '${userName} or EmailAdress = '${username}'`);
        return result.length > 0;
    },

    // active account
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
    // get otp 
    singleOtp: async function (username, email) {
        const rows = await db.load(`select otpverify from ${TBL_USER} where UserName = '${username}' or EmailAdress = '${email}'`);
        if (rows.length === 0)
            return null;
        return rows[0];
    }
}