// Importing Required Modules
const express = require("express");
const apiRouter = express.Router();
const db = require("./db");
const jsonwebtoken = require("jsonwebtoken");
const { hashSync, genSaltSync, compareSync } = require("bcrypt");
const cookieParser = require("cookie-parser");
const userRouter = require("./user");
const stripe= require('stripe')(process.env.STRIPE_SECRET_KEY);

// Middleware Setup
apiRouter.use(cookieParser());

// Register Route
apiRouter.post("/register", async (req, res, next) => {
  try {
    const email = req.body.email;
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const phone = req.body.phone;
    const address_line = req.body.address_line;
    const state = req.body.state;
    const postcode = req.body.postcode;
    const city = req.body.city;
    let password = req.body.password;
    if (
      !first_name ||
      !last_name ||
      !email ||
      !password ||
      !phone ||
      !address_line ||
      !state ||
      !postcode ||
      !city
    ) {
      return res.sendStatus(400);
    }

    const salt = genSaltSync();
    const hashedPassword = hashSync(password, salt);

    const characters =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    function generateCartId() {
      let result = " ";
      const charactersLength = characters.length;
      for (let i = 0; i < 20; i++) {
        result += characters.charAt(
          Math.floor(Math.random() * charactersLength)
        );
      }
      return result;
    }

    const cartId = generateCartId();

    const user = await db.insertUser(
      email,
      first_name,
      last_name,
      phone,
      address_line,
      state,
      postcode,
      city,
      hashedPassword
    );

    const cart = await db.createCart(cartId, email);

    const jsontoken = jsonwebtoken.sign(
      { email: email },
      process.env.SECRET_KEY,
      { expiresIn: "30m" }
    );
    res.cookie("token", jsontoken, {
      httpOnly: true,
      secure: true,
      SameSite: "strict",
      expires: new Date(Number(new Date()) + 30 * 60 * 1000),
    }); //we add secure: true, when using https.

    // Construct the AuthModel object with the api_token
    const authData = {
      api_token: jsontoken,
      // Optionally include a refreshToken if needed
      // refreshToken: generateRefreshToken(),
    };

    // Return the authData object as JSON response
    return res.json(authData);

    //return res.redirect('/mainpage');
  } catch (e) {
    console.log(e);
    res.sendStatus(400);
  }
});

apiRouter.post("/verify_token", async (req, res, next) => {
  const { api_token } = req.body; // Extract the token from the 'api_token' property

  if (!api_token) {
    return res.status(400).json({ message: "Token not provided" });
  }

  try {
    const decoded = jsonwebtoken.verify(api_token, process.env.SECRET_KEY);
    const email = decoded.email;

    if (!email) {
      return res
        .status(400)
        .json({ message: "Email not found in token payload" });
    }

    const user = await db.getUserByEmail(email);

    const cart = await db.getCartByEmail(email);

    // If cart is found, add the cart_id to the user object
    if (cart) {
      user.cart_id = cart.Cart_id; // Assuming the field name is cart_id in the user object
    }
    

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Remove sensitive data from the user object before sending it
    user.password = undefined;

    res.status(200).json(user);
  } catch (error) {
    console.error("JWT verification error:", error);
    res.status(401).json({ message: "Invalid token" });
  }
});

apiRouter.post("/login", async (req, res, next) => {
  try {
    const email = req.body.email;
    const password = req.body.password;
    const user = await db.getUserByEmail(email);

    if (!user) {
      return res.json({ message: "Invalid email" });
    }

    const isValidPassword = compareSync(password, user.password); // Compare hashed password with entered password

    if (isValidPassword) {
      user.password = undefined; // Remove password from user object before sending in response
      const jsontoken = jsonwebtoken.sign(
        { email: email },
        process.env.SECRET_KEY,
        { expiresIn: "30m" }
      );
      res.cookie("token", jsontoken, {
        httpOnly: true,
        secure: true,
        SameSite: "strict",
        expires: new Date(Number(new Date()) + 30 * 60 * 1000),
      });
      const authData = {
        api_token: jsontoken,
        // Optionally include a refreshToken if needed
        // refreshToken: generateRefreshToken(),
      };

      // Return the authData object as JSON response
      return res.json(authData);
    } else {
      return res.json({ message: "Invalid password" });
    }
  } catch (e) {
    console.log(e);
    res.sendStatus(400);
  }
});

//  Token Verification Middleware
async function verifyToken(req, res, next) {
  const token = req.cookies.token;
  console.log(token);

  if (token === undefined) {
    return res.json({
      message: "Access Denied! Unauthorized User",
    });
  } else {
    jsonwebtoken.verify(token, process.env.SECRET_KEY, (err, authData) => {
      if (err) {
        res.json({
          message: "Invalid Token...",
        });
      } else {
        console.log(authData.user.role);
        const role = authData.user.role;
        if (role === "admin") {
          next();
        } else {
          return res.json({
            message: "Access Denied! you are not an Admin",
          });
        }
      }
    });
  }
}

// Route to get all product
apiRouter.get("/getProducts", async (req, res) => {
  try {
    const products = await db.allProducts(); // Assuming there is a function getAllProducts in your db module
    res.send({ products });
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).json({ message: "Failed to fetch products" });
  }
});

// Route to get latest product
apiRouter.get("/getLatestProducts", async (req, res) => {
  try {
    const products = await db.getLatestProducts(); // Assuming there is a function getAllProducts in your db module
    res.send({ products });
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).json({ message: "Failed to fetch products" });
  }
});

// Route to get one product
apiRouter.get("/getProductFromId/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const product = await db.getProductFromId(id); // Assuming there is a function getProductFromId in your db module
    res.send({ product }); // Sending product as an object with the key 'product'
  } catch (error) {
    console.error("Error fetching product:", error);
    res.status(500).json({ message: "Failed to fetch product" });
  }
});

// Route to get states for address validation
apiRouter.get("/getStates", async (req, res) => {
  try {
    const states = await db.getStates();
    res.send({ states });
  } catch (error) {
    console.error("Error fetching states:", error);
    res.status(500).json({ message: "Failed to fetch states" });
  }
});

// Route to get Postcodes for postcode validation
apiRouter.get("/getPostcodes", async (req, res) => {
  try {
    const postcodes = await db.getPostcodes();
    res.send({ postcodes });
  } catch (error) {
    console.error("Error fetching postcodes:", error);
    res.status(500).json({ message: "Failed to fetch postcodes" });
  }
});

apiRouter.post("/addToCart", async (req, res) => {
  try {
    const { cart_id, product_id, qty, date_added } = req.body; // Extracting parameters from the request body
    const cartItem = await db.addToCart(cart_id, product_id, qty, date_added); // Call the addToCart function with the provided parameters
    res.status(200).json(cartItem); // Sending a success response
  } catch (error) {
    console.error("Error add to cart:", error);
    res.status(500).json({ message: "Failed to add to cart" }); // Sending an error response
  }
});

// Route to get all cart items
apiRouter.get("/getCartItems/:cart_id", async (req, res) => {
  try {
    const cart_id = req.params.cart_id;
    const products = await db.allCartItems(cart_id); 
    res.send({ products });
  } catch (error) {
    console.error("Error fetching cart items:", error);
    res.status(500).json({ message: "Failed to fetch items" });
  }
});

// Route to get all cart items
apiRouter.get("/getCartItemCount/:cart_id", async (req, res) => {
  try {
    const cart_id = req.params.cart_id;
    const products = await db.allCartItems(cart_id); 
    const count = products.length;
    res.send({count});
  } catch (error) {
    console.error("Error fetching cart items:", error);
    res.status(500).json({ message: "Failed to fetch items" });
  }
});

apiRouter.post("/updateCart", async (req, res, next) => {
  try {
    const cart_id = req.body.cart_id;
    const product_id = req.body.product_id;
    const qty = req.body.newQty;

    // Call db.updateCart to update the cart items
    await db.updateCart(cart_id, product_id, qty); 

    // Fetch the updated cart items from the database after the update
    const updatedCartItems = await db.allCartItems(cart_id); // Implement fetchCartItems function to fetch cart items from the database

    // Send the updated cart items in the response
    res.send({updatedCartItems});
  } catch (error) {
    console.error("Error updating cart items:", error);
    res.status(500).json({ message: "Failed to update items" });
  }
});

apiRouter.post("/deleteCart", async (req, res, next) => {
  try {
    const cart_id = req.body.cart_id;
    const product_id = req.body.product_id;

    // Call db.updateCart to update the cart items
    await db.deleteCart(cart_id, product_id); 

    // Fetch the updated cart items from the database after the update
    const updatedCartItems = await db.allCartItems(cart_id); // Implement fetchCartItems function to fetch cart items from the database

    // Send the updated cart items in the response
    res.send({updatedCartItems});
  } catch (error) {
    console.error("Error deleting cart items:", error);
    res.status(500).json({ message: "Failed to delete items" });
  }
});

// API for Stripe payment gateway
apiRouter.post("/create-checkout-session", async (req, res) => {
  try{
    const { products } = req.body;

    const lineItems = products.map((product)=>({
      price_data: {
        currency: 'myr',
        product_data: {
          name: product.product_details.product_name,
          description: product.product_details.product_id,
        },
        unit_amount: product.product_details.product_price * 100, // Amount in cents
      },
      quantity: product.qty,
    }));
  
    const session = await stripe.checkout.sessions.create({
      payment_method_types:['card','fpx','grabpay'],
     
      line_items:lineItems,
      mode:"payment",
      success_url:"http://localhost:5173/main",
      cancel_url:"http://localhost:5173/login"
    })
    res.json({id:session.id})
  }
  catch (error) {
    console.error("Error during payment:", error);
    res.status(500).json({ message: "Failed to make payment" });
  }
 
})



apiRouter.use("/user", verifyToken, userRouter);

module.exports = apiRouter;
