const express = require("express");
const router = express.Router();
const categoryModel = require("../../models/category.model");

router.get('/', async (req, res) => {
    const page = req.query.page || 1;
    const numOfcate = categoryModel.countCategory();
    const categoryList = await categoryModel.getListCategory();
    res.render('dashboard/category',{categoryList});
});

router.post('/delete', async (req, res) => {
    const rs = await categoryModel.deleteCategory(req.body.categoryId);
    res.redirect('/category');
});
module.exports = router;