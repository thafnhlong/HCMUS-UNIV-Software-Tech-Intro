console.log(`this is ${process.env.ENVIROMENT} environment`);

const express = require("express");

//TIME ZONE:
process.env.TZ = "Asia/Ho_Chi_Minh";

const app = express();
app.use(express.static('public'));

app.use(
  express.urlencoded({
    extended: true,
  })
);

/**Async Error router Handler */
require('./utils/async-error-handler')

//config view_engine and libraries helper as hbs-sections
require('./middlewares/viewengine.mdw')(app);
require('./middlewares/session.mdw')(app);
require('./middlewares/local.mdw')(app);

//schedule
require('./schedule/updateLike')
require('./schedule/updateComments')

app.use(require("./routes/songs/searchs"));
app.use(require('./routes/user.route'));
app.use(require("./routes/dashboard"));
app.use('/music', require('./routes/music.route'));
app.use('/album', require('./routes/album.route'));
app.get("/", require('./routes/home.route'));

app.get("/throw", async (req, res) => {
  throw new Error("error");
});
app.use(function (req, res) {
  res.status(404).render('404',{fullPage:true})
});

app.use(function (err, req, res, next) {
  console.error(err);
  res.status(500);
  if (process.env.ENVIROMENT === "production")
    return res.render('500',{fullPage:true})
  // res.send(err.stack);
  res.render('500',{fullPage:true})
});

app.listen(process.env.WEB_PORT, () => {
  console.log(
    `Server is running at ${process.env.WEB_URL}:${process.env.WEB_PORT}`
  );
});
