require("dotenv").config();
const express  = require("express");
const mongoose = require("mongoose");

const port = process.env.PORT || 15500;
const app = express();

var password = process.env.mogodbPassword;

mongoose.connect("mongodb+srv://ngtrieu:"+password+"@cluster0.dc7ydpu.mongodb.net/EcommerceDB?retryWrites=true&w=majority");
const  connection = mongoose.connection;

connection.once("open", ()=>{
    console.log("Mongo DB connection successfull")
});
app.route("/").get((req, res)=>{
    res.json("Hello")
});


//middleware
// app.route("/login").get((req, res)=>{
//     res.json("Hello")
// });
app.use(express.json());
const loginRoutes = require("./routes/login.routes");
const userDetailsRoutes = require("./routes/user_details.routes");
app.use("/login", loginRoutes);
app.use("/user-details", userDetailsRoutes);

app.listen(port, "0.0.0.0", ()=>{
    console.log("Welcome: ", port);
});