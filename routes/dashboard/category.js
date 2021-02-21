const express = require("express");
const router = express.Router();
const categoryModel = require("../../models/category.model");
const config = require("../../config/default.json");

router.get('/', async (req, res) => {
    const page = +req.query.page || 1;
    const numOfcate = await categoryModel.countCategory();
    const offset = (page - 1) * config.pagination.limitCategory;
    const categoryList = await categoryModel.getListCategoryByPagination(config.pagination.limitCategory, offset);
    const nPages = Math.ceil(numOfcate / config.pagination.limitCategory);
    const page_Items = [];
    for (let i = 1; i <= nPages; i++){
        const item = {
            value: i,
            isActive: i === page
        }
        page_Items.push(item);
    }
    res.render('dashboard/category',{
        categoryList,
        page_Items, 
        pre_Value: page - 1,
        next_Value: page + 1,
        can_Prev: page > 1,
        can_Next: page < nPages
    });
});

router.post('/delete', async (req, res) => {
    const rs = await categoryModel.deleteCategory(req.body.categoryId);
    res.redirect('/category');
});
module.exports = router;