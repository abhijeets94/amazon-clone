console.log("HELLO, WORLD")
const express = require("express"); //similar to import in flutter
const mongoose = require("mongoose");


//IMPORT FROM PACKAGES


//IMPORT FROM FILES
const authRouter = require('./routes/auth');




//INIT

//first api using express
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://abhijeets94:abhijeet1234@cluster0.7ur2yjy.mongodb.net/?retryWrites=true&w=majority"


//middleware
app.use(express.json());
app.use(authRouter);

//Connections 
mongoose.connect(DB).then(() => {
    console.log("connection success")
}).catch((e) => {console.log(`Exception ${e} occured!`)});

//GET, PUT, POST, DELETE, UPDATE = CRUD  

//we need to specify "0.0.0.0" as it wont work on android emulators
app.listen(PORT, () => {
    console.log(`Connected at port ${PORT} hello`);


    
} ) 