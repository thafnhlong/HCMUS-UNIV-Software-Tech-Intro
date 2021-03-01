const schedule = require('node-schedule');
const config = require('../config/default.json')
const songModel = require('../models/song.model')

let isUpdateLike = true

const job = schedule.scheduleJob({second:config.schedule.song}, function(){
    console.log('Time for tea!');
    
    if (isUpdateLike){
        songModel.updateLike().then(()=>{
            console.log('Updated');
            isUpdateLike=false
        }).catch(console.log)
    }
});

exports.setUpdateLike = () => isUpdateLike=true