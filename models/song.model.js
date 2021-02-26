const db=require("../utils/dao");

const TBL_SONG="Songs";
const TBL_Users_Comments = "Users_Comments";
const TBL_Users = "Users";
module.exports={
    add: function(song){
        return db.add(TBL_SONG, song);
    },
    delete: async(id,author) => {
        let sql = ''
        if (author)
            sql =` and author=${author}`
        return db.load(`UPDATE ${TBL_SONG} CT SET CT.delete=1  WHERE ID=${id} ${sql}`)
    },
    getListSong:async(id=-1)=>{
        let sql =''
        if (id!=-1)
            sql = ` and author=${id}`
        return db.load(`SELECT CT.* FROM ${TBL_SONG} CT 
            WHERE CT.delete is NULL ${sql}`
        );
    },
    getById: async(id,author)=>{
        let sql = ''
        if (author)
            sql =` and author=${author}`
        return db.load(`SELECT * FROM ${TBL_SONG} CT WHERE ID= '${id}' AND CT.delete is NULL ${sql}`)
    },
    patch: async(id,entity) =>{
        return db.patch(TBL_SONG,entity,{id})
    },
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