const exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
const moment = require('moment');

module.exports = function (app) {
    app.engine('hbs', exphbs({
        defaultLayout: 'main.handlebars',
        helpers:
        {
            section: express_handlebars_sections(),
            parseTime: (time) => {
                moment.locale('vi');
                return moment(time).format('HH:mm, DD/MM/YYYY');
            },
        }
    }));
    app.set('view engine', 'hbs');
};