const db=require("../utils/dao");

const TBL_SONG="Songs";

module.exports={
    search: function(searchString){
        return db.load(`SELECT * FROM ${TBL_SONG} WHERE Name LIKE '${searchString}'`);
    }
}