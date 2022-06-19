const express = require("express");
const router = express.Router();
const jwt = require("jsonwebtoken");
const User = require("../model/user.model");
const config = require("../config");

router.route("/").post((req, res) => {
    console.log(req.body);
  User.findOne(
    {
      mobileNo: req.body.mobileNo,
    },
    (err, result) => {
      if (err) {
        return res.status(403).json({ msg: "Something error" });
      }

      if (result !== null) {
        sendToken(res, req.body.mobileNo, "Login success!");
        console.log("Login ", result);
      } else {
          // const user = User({
          //   mobileNo: req.body.mobileNo
          // });

          // user.save().then(()=>{
          //   sendToken(res, req.body.mobileNo, "Register success!");
          // }).catch((error)=>{
          //   res.json({token: error, msg: "Error"});
          // });
        console.log("register");
        res.json({msg: "register"});
      }
    //   return res.json({ msg: "Very good" });
    }
  );
});


router.route("/register").post( (req,res)=>{
  const user = User({

    mobileNo: req.body.mobileNo,
    password: req.body.password,
    fullname: req.body.fullname,
    email: req.body.email,
    gender: req.body.gender,
    alternateMoNumber: req.body.alternateMoNumber,
    hint: req.body.hint,

  });

  user
  .save()
  .then(()=>{
    sendToken(res, req.body.mobileNo, "Register success!");
  }).catch((error)=>{
    res.status(500).json({token: error, msg: "Error"});
  });
});

const sendToken = (res, mobileNo, msg) => {
    let token = jwt.sign({mobileNo: mobileNo}, config.key);
    res.json({token: token, msg: msg});
}
module.exports = router;
