console.log(`this is ${process.env.ENVIROMENT} environment`);

const express = require("express");

//TIME ZONE:
process.env.TZ = "Asia/Ho_Chi_Minh";

const app = express();

app.use(
  express.urlencoded({
    extended: true,
  })
);

//config view_engine and libraries helper as hbs-sections
require("./middlewares/viewengine.mdw")(app);

app.use("/public", express.static("public"));

//app.get('/',(req,res)=>res.send('Muzik'));

app.get("/", (req, res) => {
  res.render("home.hbs");
});

//app.use('/', require('./routes/user.route'));

app.use("/dashboard", require("./routes/dashboard.rote"));

app.get("/throw", (req, res) => {
  throw new Error("error");
});
app.use(function (req, res) {
  res.status(404).send("Not found");
});

app.use(function (err, req, res, next) {
  console.error(err);
  res.status(500);
  if (process.env.ENVIROMENT === "production")
    return res.send("Internal server error");
  res.send(err.stack);
});

app.listen(process.env.WEB_PORT, () => {
  console.log(
    `Server is running at ${process.env.WEB_URL}:${process.env.WEB_PORT}`
  );
});
