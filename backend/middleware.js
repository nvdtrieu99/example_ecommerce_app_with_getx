const jwt = require("jsonwebtoken");
const config = require("./config");
let checkToken = (req, res, next)=>{
    let token = req.headers["authorization"];
    console.log(token);
    
    if (token){
        token = token.slice(7, token.length);
        jwt.verify(token, config.key, (err, decoded)=>{
            if (err){
                return res.json({
                    status: false,
                    msg: "Invalid Token"
                });
            }else{
                req.decoded = decoded;
                next();
            }
        });
    }else{
        return res.json({
            status: false,
            msg: "Token not provided"
        });
    }
}

module.exports={
    checkToken: checkToken
}