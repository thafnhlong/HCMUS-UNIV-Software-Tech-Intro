console.log(`this is ${process.env.ENVIROMENT} environment`)

const express = require('express');
const exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');

//TIME ZONE:
process.env.TZ = "Asia/Ho_Chi_Minh"

const app = express();

app.engine('hbs',exphbs({
  helpers: {
    section: express_handlebars_sections()
  }
}));

app.set('view engine', 'hbs');
app.use(express.urlencoded({
  extended: true
}));

app.use('/public', express.static('public'));

app.get('/',(req,res)=>res.send('Muzik'));
app.use('/', require('./routes/user.route'));
app.get('/throw',(req,res)=>{throw new Error("error")})
app.use(function (req, res) {
  res.status(404).send('Not found')
})

app.use(function (err, req, res, next) {
  console.error(err);
  res.status(500)
  if (process.env.ENVIROMENT === 'production')
    return res.send('Internal server error')
  res.send(err.stack)
})

app.listen(process.env.WEB_PORT, () => {
  console.log(`Server is running at ${process.env.WEB_URL}:${process.env.WEB_PORT}`);
})