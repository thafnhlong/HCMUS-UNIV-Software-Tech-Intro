const schedule = require('node-schedule');
const config = require('../config/default.json')
const songModel = require('../models/song.model')

const job = schedule.scheduleJob({second:config.schedule.song}, function(){
    console.log('Time for tea!');
    songModel.updateLike().then(()=>{
        console.log('Updated');
    }).catch(console.log)
});