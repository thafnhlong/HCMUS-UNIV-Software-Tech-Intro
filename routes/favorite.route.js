const express = require("express");
const router = express.Router();
const SongModel = require("../models/song.model");

router.get('/', async (req, res) => {
    const userId = res.locals.lcAuthUser.ID;
    const favoriteList = await SongModel.getFavoriteListByUserId(userId);
    res.render('../views/vwMusic/favorite.hbs', {favoriteList})
});

router.post('/delete', async (req, res) => {
    const id = req.body.id;
    const rs = await SongModel.deleteFavoriteSongById(id);
    let status = true;
    if (rs.affectedRows === 0){
        status = false;
    }
    res.status(200).send(status); 
});







module.exports = router;