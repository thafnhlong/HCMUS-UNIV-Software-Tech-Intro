const db=require("../utils/dao");

const TBL_SONG="Songs";
const TBL_Users_Comments = "Users_Comments";
module.exports={
    search: function(searchString){
        return db.load(`SELECT * FROM ${TBL_SONG} WHERE Name LIKE '${searchString}'`);
    },
    addComment: function(entity){
        return db.add(TBL_Users_Comments, entity);
    },
    getCommentListById: function(id){
        return db.load(`SELECT us.ID, us.userName, us.avatar, usCM.content 
        FROM ${TBL_Users_Comments} usCM JOIN users us ON usCM.User = us.ID WHERE usCM.Song = ${id} and usCM.delete = 0`);
    }
}