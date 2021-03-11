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

router.get('/:id/edit',(req,res,next)=>{
    categoryModel.getByID(req.params.id).then(resp=>{
        if (resp.length > 0) {
            const currentCategory = resp[0]
            res.render('vwCategory/add', {currentCategory, isEdit: true});
        }
        else 
            throw null
    })
    .catch(next)
})

router.post('/edit',async (req,res)=>{
    var entity={
        ID: req.body.categoryId,
        Name: req.body.name,
        description: req.body.description,
        createDate: new Date()
    }
    await categoryModel.edit(entity);
    res.redirect('/category?status=edited');
})

router.get('/add', (req,res)=>{
    res.render('vwCategory/add');
});
router.post('/add',async (req,res)=>{
    var entity={
        Name: req.body.name,
        description: req.body.description,
        delete: 0,
        createDate: new Date()
    }
    await categoryModel.add(entity);
    res.redirect('/category?status=added');
})
module.exports = router;