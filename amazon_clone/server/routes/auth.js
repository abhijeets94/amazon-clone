const express = require("express");
const User = require("../model/user");
const bcryptjs = require("bcryptjs");

const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
try {
     //get the data from the client
   const { name, email, password } = req.body;

   const existingUser = await User.findOne({email});
   //existingUser is not bool, in js it just check if its not empty
   if(existingUser) {
    return res.status(400).json({msg: "User with same email already exists!"});
   }

   //for encryption and 8 is salt which randomizes the string
   const hashedPassword = await bcryptjs.hash(password, 8); 

   let user = new User({
    email,
    password: hashedPassword,
    name,
   });

   user = await user.save();
   res.json({user: user});

    //post the data in database
    //return the data to user
} catch (e) {
    res.status(500).json({error : e.message});
}
    
   
});

module.exports = authRouter; //add parameters by {authRouter, name: "PERSON_NAME"}