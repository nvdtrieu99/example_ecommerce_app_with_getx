const express = require("express");
const middleware = require("../middleware");
const router = express.Router();
const User = require("../model/user.model");

router.route("/").get(middleware.checkToken, (req, res)=>{
    console.log("req decoded", req.decoded);
    
    User.findOne({mobileNo: req.decoded.mobileNo}, (err, result)=>{
        // console.log(result);
        if (err){
            return res.status(500).json({msg: "Error", result: err});
        }else{
            return res.status(200).json({msg: "Success", result: result});
        }
    });
});


module.exports = router;