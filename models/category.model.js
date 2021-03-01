const db = require("../utils/dao");

const TBL_Categories = "Categories";
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
    deleteCategory: function (ID) {
        const entity = {
            delete: 1
        }
        const conditions = {
            ID: ID
        }
        return db.patch(TBL_Categories, entity, conditions);
    }
}