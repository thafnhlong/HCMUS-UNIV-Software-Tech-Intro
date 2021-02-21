const db=require("../utils/dao");

const TBL_SONG="Songs";
const TBL_Users_Comments = "Users_Comments";
const TBL_Users = "Users";
module.exports={
    search: function(searchString){
        return db.load(`SELECT * FROM ${TBL_SONG} WHERE Name LIKE '${searchString}'`);
    },
    addComment: function(entity){
        return db.add(TBL_Users_Comments, entity);
    },
    getCommentListById: function(id){
        return db.load(`SELECT us.ID, us.userName, us.avatar, usCM.content, DATE_FORMAT(usCM.createDate, "%M %d, %Y %H:%i") as cmDate
        FROM ${TBL_Users_Comments} usCM JOIN ${TBL_Users} us ON usCM.User = us.ID 
        WHERE usCM.Song = ${id} and usCM.delete = 0
        ORDER BY usCM.createDate DESC`);
    },
    getNewCommentOfUserById: async function(idUser, idSong) {
        const commentInfo = await db.load(`SELECT usCM.ID, usCM.content, DATE_FORMAT(usCM.createDate, "%M %d, %Y %H:%i") as cmDate 
        FROM Users_Comments usCM 
        WHERE usCM.User = ${idUser} And usCM.Song = ${idSong}
        ORDER BY usCM.createDate DESC LIMIT 1`);
        return commentInfo[0];
    }
}