// Setting up MySQL Connection Pool
const mysql = require('mysql');
 
const pool = mysql.createPool({
    connectionLimit: process.env.CONNECTION_LIMIT,    
    password: process.env.DB_PASS,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT
});

// Defining Database Operations in the db Object
let db = {};
 
// ***Requests to the User table ***
db.allUser = () =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM User ', (error, users)=>{
            if(error){
                return reject(error);
            }
            return resolve(users);
        });
    });
};
 
db.getUserByEmail = (email) =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM User WHERE email = ?', [email], (error, users)=>{
            if(error){
                return reject(error);
            }
            return resolve(users[0]);
        });
    });
};

db.getCartByEmail = (email) => {
    return new Promise((resolve, reject) => {
        pool.query('SELECT Cart_id FROM Cart WHERE email = ?', [email], (error, results) => {
            if (error) {
                return reject(error);
            }
            // Assuming you expect only one row for a given email, you can resolve the first result
            if (results.length > 0) {
                return resolve(results[0]);
            } else {
                // If no cart found for the email, resolve with null
                return resolve(null);
            }
        });
    });
};

 
db.insertUser = (email, first_name, last_name, phone, address_line, state, postcode, city, password) =>{
    return new Promise((resolve, reject)=>{
        pool.query('INSERT INTO User (email, first_name, last_name, phone, address_line, state, postcode, city, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', [email, first_name, last_name, phone, address_line, state, postcode, city, password], (error, result)=>{
            if(error){
                return reject(error);
            }
              return resolve(result.insertId);
        });
    });
};

db.createCart = (cart_id, email) => {
    return new Promise((resolve, reject)=>{
        pool.query('INSERT INTO Cart (cart_id, email) VALUES (?, ?)', [cart_id, email], (error, result)=>{
            if(error){
                return reject(error);
            }
              return resolve(result);
        });
    });
};

db.addToCart = (cart_id, product_id, qty, date_added) => {
    return new Promise(async (resolve, reject) => {
        const combinedCartItems = []; 
        const cartItems = await db.allCartItems(cart_id);

        for (let i = 0; i < cartItems.length; i++) {
            const currentProduct_id = cartItems[i].product_id;
            const productDetails = await db.getProductFromId(currentProduct_id);

            if (currentProduct_id === product_id) {
                // If exists, increment the quantity
                pool.query('UPDATE Cart_item SET qty = qty + ? WHERE Cart_id = ? AND product_id = ?', [qty, cart_id, product_id], (error, result) => {
                    if (error) {
                        reject(error);
                    } else {
                        resolve(result);
                    }
                });
                return; // Exit the function after updating the quantity
            }
        }

        // If not found, add a new cart item
        pool.query('INSERT INTO Cart_item (cart_id, product_id, qty, date_added) VALUES (?, ?, ?, ?)', [cart_id, product_id, qty, date_added], (error, result) => {
            if (error) {
                reject(error);
            } else {
                resolve(result);
            }
        });
    });
};

 
db.updateUser = (userName, role, email, password, id) =>{
    return new Promise((resolve, reject)=>{
        pool.query('UPDATE User SET user_name = ?, role= ?, email= ?, password=? WHERE id = ?', [userName, role, email, password, id], (error)=>{
            if(error){
                return reject(error);
            }  
              return resolve();
        });
    });
};
 
db.deleteUser = (id) =>{
    return new Promise((resolve, reject)=>{
        pool.query('DELETE FROM User WHERE id = ?', [id], (error)=>{
            if(error){
                return reject(error);
            }
            return resolve(console.log("User deleted"));
        });
    });
};

// ***Requests to the Product table ***
db.allProducts = () =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM Product ', (error, products)=>{
            if(error){
                return reject(error);
            }
            return resolve(products);
        });
    });
};

db.getLatestProducts = () =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM product WHERE product_added_date >= DATE_SUB(NOW(), INTERVAL 2 MONTH)', (error, products)=>{
            if(error){
                return reject(error);
            }
            return resolve(products);
        });
    });
};

db.getProductFromId = (id) =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM product WHERE product_id = ?', [id], (error, product)=>{
            if(error){
                return reject(error);
            }
            return resolve(product[0]);
        });
    });
};

// ***Requests to the State table ***
db.getStates = () =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM State ', (error, states)=>{
            if(error){
                return reject(error);
            }
            return resolve(states);
        });
    });
};

// ***Requests to the Postcode table ***
db.getPostcodes = () =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM Postcode ', (error, postcodes)=>{
            if(error){
                return reject(error);
            }
            return resolve(postcodes);
        });
    });
};


db.allCartItems = (cart_id) =>{
    return new Promise((resolve, reject)=>{
        pool.query('SELECT * FROM Cart_item WHERE Cart_id = ? ', [cart_id],  async (error, cartItems)=>{
            if(error){
                return reject(error);
            }
            try {
                // Loop through each cart item to fetch product details
                for (let i = 0; i < cartItems.length; i++) {
                    const product_id = cartItems[i].product_id;
                    const productDetails = await db.getProductFromId(product_id);
                    // Assign product details to the cart item
                    cartItems[i].product_details = productDetails;
                }
                // Resolve with cart items including product details
                resolve(cartItems);
            } catch (err) {
                reject(err);
            }
        });
    });
};

db.updateCart = (cart_id, product_id, newQty) => {
    return new Promise((resolve, reject) => {
        pool.query('UPDATE Cart_item SET qty = ? WHERE Cart_id = ? AND Product_id = ?', [newQty, cart_id, product_id], async (error, result) => {
            if (error) {
                return reject(error);
            }
            // Resolve with the result of the update operation
            resolve(result);
        });
    });
};

db.deleteCart = (cart_id, product_id) => {
    return new Promise((resolve, reject) => {
        pool.query('DELETE FROM Cart_item WHERE Cart_id = ? AND Product_id = ?', [cart_id, product_id], async (error, result) => {
            if (error) {
                return reject(error);
            }
            // Resolve with the result of the update operation
            resolve(result);
        });
    });
};





module.exports = db;