const db = require("../utils/dao");

const TBL_Categories = "Categories";
module.exports = {
    countCategory: async function () {
        const rs = db.load(`SELECT count(CT.ID) as numOfcate FROM ${TBL_Categories} CT WHERE CT.delete = 0`);
        return rs[0].numOfcate;
    },
    getListCategoryByPagination: function (page, offset) {
        return db.load(`SELECT CT.* FROM ${TBL_Categories} CT WHERE CT.delete = 0`);
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