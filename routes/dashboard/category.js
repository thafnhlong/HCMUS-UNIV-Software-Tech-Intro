const express = require("express");
const router = express.Router();
const categoryModel = require("../../models/category.model");
const config = require("../../config/default.json");
const helper = require("../../utils/helper");

router.get('/', async (req, res) => {
    const page = +req.query.page || 1;
    const numOfcate = await categoryModel.countCategory();
    const offset = (page - 1) * config.pagination.limitCategory;
    const categoryList = await categoryModel.getListCategoryByPagination(config.pagination.limitCategory, offset);
    const nPages = Math.ceil(numOfcate / config.pagination.limitCategory);
    const Pagination = helper.Pagination(nPages, page);
    res.render('dashboard/category',{
        categoryList,
        Pagination
    });
});

router.post('/delete', async (req, res) => {
    const rs = await categoryModel.deleteCategory(req.body.categoryId);
    res.redirect('/category');
});



router.get('/getIdName',(req,res,next)=>{
    categoryModel.getIdName().then(res.json.bind(res)).catch(next)
})

router.get('/:id/edit',(req,res)=>{
    res.render('home')
})

router.get('/add', (req,res)=>{
    res.render('vwCategory/add');
});
router.post('/add',async (req,res)=>{
    var entity={
        Name: req.body.name,
        description: req.body.description,
        createDate: new Date()
    }
    if(await categoryModel.add(entity))
    {
        return res.render('vwCategory/add',{Success:true});
    }
    res.redirect('/category/add')
})
module.exports = router;