const express = require("express");
const { now } = require("moment");
const songModel = require("../models/song.model");
const router = express.Router();
const SongModel = require("../models/song.model");

router.get('/:id', (req, res,next) => {
    const id = +req.params.id || 1;
    let musicData={}

    songModel.getById(id).then(resp => {
      if (resp.length == 0)
        throw null

      musicData=resp[0]
      songModel.patch(id,{views:musicData.views+1})
      return songModel.getCommentListById(id)
    })
    .then(resp=>{
        res.render("../views/vwMusic/detailMusic.hbs", {
            playable: true, 
            idMusic: id, 
            listComment: resp,
            musicData
        });
    })
    .catch(next)    
});

router.post('/addcomment', async (req, res) => {
    var info = "";
    try{
      info = JSON.parse(req.body.info);
    }
    catch (error)
    {
      console.error(error.message);
    }
    const entity = {
      User: res.locals.lcAuthUser.ID,
      Song: info.dataToSend.idMusic,
      content: info.dataToSend.comment,
      delete: 0,
      createDate: new Date(),
      modifileDate: new Date()
    }
    const rs = await SongModel.addComment(entity);
    const getCommentDate = await SongModel.getNewCommentOfUserById(entity.User, entity.Song);
    const result = {
      status: true,
      cmDate: getCommentDate.cmDate
    };
    if (rs.affectedRows > 0)
    {
        return res.status(200).send(result);
    }
    result.status = false;
    res.status(200).send(result); 
});

router.get('/like',(req,res)=>{
  res.send(Math.random() > 0.5 ? '1':'0')
})
router.post('/like',(req,res)=>{
    res.send(Math.random() > 0.5 ? '1':'0')
})


module.exports = router;