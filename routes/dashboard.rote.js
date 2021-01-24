const express = require("express");
const router = express.Router();

router.get("/profile", (req, res) => {
  let role = req.query.role;
  if (role === "admin") {
    res.render("dashboard/profile.hbs", {
      admin: true,
    });
  } else {
    res.render("dashboard/profile.hbs", {
      user: true,
    });
  }
});

module.exports = router;
