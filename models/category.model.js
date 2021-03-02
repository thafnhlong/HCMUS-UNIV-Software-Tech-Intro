const db = require("../utils/dao");

const TBL_Categories = "Categories";
const TBL_SONG="Songs";

module.exports = {
    countCategory: async function () {
        const rs = await db.load(`SELECT count(CT.ID) as numOfcate FROM ${TBL_Categories} CT WHERE CT.delete = 0`);
        return rs[0].numOfcate;
    },
    getByID: async id => {
        return db.load(`SELECT CT.* FROM ${TBL_Categories} CT WHERE CT.delete = 0 and ID=${id}`)
    },
    getIdName: async ()=>{
        return db.load(`SELECT CT.ID,CT.Name FROM ${TBL_Categories} CT WHERE CT.delete = 0`)
    },
    getListCategoryByPagination: function (page, offset) {
        return db.load(`SELECT CT.* FROM ${TBL_Categories} CT 
            WHERE CT.delete = 0 limit ${page} offset ${offset}`
        );
    },
    getAlbum: async(num)=>{
        return db.load(`SET @rank_song=0,@category=-1;
        SELECT s.*,c.Name categoryName
        FROM ${TBL_Categories} c JOIN ( 
            SELECT ID,Name,composer,
                @rank_song:=if(@category=category,@rank_song+1,1) as rank_song,@category:=category as category
            FROM ${TBL_SONG} s
            WHERE s.delete is null and s.status=1
            ORDER BY category, publishDate desc
        ) s on c.ID=s.category
        WHERE c.delete != 1 and rank_song <= ${num}`)
    },
    deleteCategory: function (ID) {
        const entity = {
            delete: 1
        }
        const conditions = {
            ID: ID
        }
        return db.patch(TBL_Categories, entity, conditions);
    },
    add: function(category){
        return db.add(TBL_Categories, category);
    }
}