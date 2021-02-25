const express = require("express");
const config = require('../../config/default.json');
const categoryModel = require("../../models/category.model");
const songModel = require("../../models/song.model");
const { uploadFn,moveFn } = require("../../utils/upload");
const { route } = require("./profile");
const router = express.Router();

const uploadMusic = async (req,res) => {
    return uploadFn(req).then(({fields,files})=>{
        let {name,singer,composer,category} = fields
        const entity={
            Name:name,
            Singer:singer,
            composer:composer,
            author:res.locals.lcAuthUser.ID,
            category:category,
            createDate:new Date(),
        }
        if (files && files.thumb && files.thumb.size > 0 
            && files.music && files.music.size > 0){
            
            return songModel.add(entity).then(resp=>{
                const insertId = resp.insertId
                moveFn(files.thumb.path,'./public/images/song/upload-'+insertId+'.png')
                moveFn(files.music.path,'./public/song/upload-'+insertId+'.mp3')
                return {succMsg: "Upload successfully."}
            })    
        }
        return {errMsg: "Upload something went wrong."}
    })
}

router.get('/upload', (req, res) => {
    res.render('dashboard/song/upload')
});

router.post('/upload', (req,res,next)=>{
    const data={method:req.query.method}
    uploadMusic(req,res).then(resp=>{
        res.render('dashboard/song/upload',{...data,...resp})
    }).catch(next)
})
module.exports = router;
