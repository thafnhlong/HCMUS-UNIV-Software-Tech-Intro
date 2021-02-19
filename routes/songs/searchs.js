const express = require("express");
const router = express.Router();
const SongModel = require('../../models/song.model');


router.get("/search/:searchString",async (req,res)=>{
    const list = await SongModel.search(req.params.searchString);
    res.render("vwSong/list.hbs", {
        songs:list,
        empty:list.length===0
    });
});

module.exports=router;