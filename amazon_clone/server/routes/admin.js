const e = require('express');
const express = require('express');
const admin = require('../middlewares/admin');
const adminRouter = express.Router();
const Product = require('../model/product');
const { emit } = require('../model/user');
const User = require('../model/user');

//Add Product

adminRouter.post('/admin/add-product',admin, async (req, res) => {
    try {
        const {name, description, images, quantity, price, category} = req.body
        let product = new Product({
            name,
            description, 
            images, 
            quantity, 
            price, 
            category,
        });

        product = await product.save();
        res.json({product: product});
    } catch (error) {
        res.status(500).json({error: e.message});
    }
});

//get all products

adminRouter.get('/admin/get-all-products', admin,  async (req, res) => {
    try {    
        const products = await Product.find({}); //gives all the product we need
        res.json(products);   
    } catch (error) {
        res.status(500).json({error:e.message});
    }
});

adminRouter.post('/admin/delete-product', admin, async(req, res) => {
    try {
        
        const {id} = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product);
    } catch (error) {
        res.status(500).json({error: e.message});
    }
})

module.exports = adminRouter;