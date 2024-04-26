import { Link } from 'react-router-dom'
import { KTIcon } from '../../../helpers'
import { useEffect, useState, useRef } from 'react';
import axios from 'axios';
import { useAuth } from '../../../../app/modules/auth';
import {loadStripe} from '@stripe/stripe-js';

interface Product {
  cart_id: string;
  cart_item_id: string,
  date_added: Date;
  product_id: string;
  qty: number;
  product_details: {
    product_id: string,
    product_name: string,
    product_price: number,
    product_desc: string,
    product_img_url: string,
    product_category: string,
    product_added_date: Date,
  }
}

const CartDrawer = () => {
  const { currentUser } = useAuth();
  const [count, setCount] = useState(0);
  const [products, setProducts] = useState<Product[]>([]);
  const [total, setTotal] = useState(0);
  const inputRefs = useRef<{ [key: string]: HTMLInputElement | null }>({});

  useEffect(() => {
    const fetchCartItems = async () => {
      try {
        if (currentUser && currentUser.cart_id) {
          const response = await axios.get(`http://localhost:3000/apiRouter/getCartItems/${currentUser.cart_id}`);
          setProducts(response.data.products);

          const productCount = response.data.products.length;
          setCount(productCount);
        }
      } catch (error) {
        console.log('Axios error:', error);
      }
    };
    fetchCartItems();

  }, [currentUser]);

  useEffect(() => {
    let totalPrice = 0;
    products.forEach(product => {
      totalPrice += product.product_details.product_price * product.qty;
    });
    setTotal(totalPrice);
    console.log(products);
  }, [products]);

  const updateQty = async (product_id: string, newQty: number) => {
    try {
      if (currentUser && currentUser.cart_id) {
        await axios.post(`http://localhost:3000/apiRouter/updateCart`, {
          cart_id: currentUser.cart_id,
          product_id: product_id,
          newQty: newQty
        });

        const response = await axios.get(`http://localhost:3000/apiRouter/getCartItems/${currentUser.cart_id}`);
        setProducts(response.data.products);
      }
    } catch (error) {
      console.log('Axios error:', error);
    }
  };

  const handleDecrement = (product_id: string) => {
    const input = inputRefs.current[product_id];
    if (input !== null && input !== undefined) {
      const newQty = parseInt(input.value, 10) - 1;
      if (newQty >= 0) {
        input.value = newQty.toString();
        updateQty(product_id, newQty);
      }
    }
  };

  const handleIncrement = (product_id: string) => {
    const input = inputRefs.current[product_id];
    if (input !== null && input !== undefined) {
      const newQty = parseInt(input.value, 10) + 1;
      input.value = newQty.toString();
      updateQty(product_id, newQty);
    }
  };

  const handleChanges = (product_id: string, newQty: string) => {
    const input = inputRefs.current[product_id];
    if (input !== null && input !== undefined) {
      input.value = newQty;
      setProducts(prevProducts => {
        return prevProducts.map(product => {
          if (product.product_id === product_id) {
            return { ...product, qty: parseInt(newQty) };
          }
          return product;
        });
      });
      updateQty(product_id, parseInt(newQty));
    }
  };

  const handleDeletion = (product_id: string) => {
    deleteCartItem(product_id);
  };

  const deleteCartItem = async (product_id: string) => {
    try {
      if (currentUser && currentUser.cart_id) {
        await axios.post(`http://localhost:3000/apiRouter/deleteCart`, {
          cart_id: currentUser.cart_id,
          product_id: product_id,
        });

        const response = await axios.get(`http://localhost:3000/apiRouter/getCartItems/${currentUser.cart_id}`);
        setProducts(response.data.products);
        window.location.reload();
      }
    } catch (error) {
      console.log('Axios error:', error);
    }
  };

  const makePayment = async () => {
    try {
      const stripe = await loadStripe("pk_test_51P6u7z2K8AaEkjMe0k3b4V2hqeqPkRT4KvPvztIEJSmYXThkaM0ggyEbzI3xCf1CudZGZlVomYg4NPiBMfB8Qt7p00V1nFZeHh");
      const body = {
        products: products
      };
  
      const headers = {
        "Content-Type": "application/json"
      };
  
      const response = await fetch(`http://localhost:3000/apiRouter/create-checkout-session`, {
        method: "POST",
        headers: headers,
        body: JSON.stringify(body)
      });
  
      if (!response.ok) {
        throw new Error('Failed to create checkout session');
      }
  
      const session = await response.json();
  
      const result = await stripe?.redirectToCheckout({
        sessionId: session.id
      });
  
      // Ensure 'result' is defined before accessing its properties
      if (result?.error) {
        throw new Error(result.error.message);
      }
    } catch (error) {
      console.error('Payment error:', error);
      // Handle the error here, display a message to the user, or take appropriate action.
    }
  };
  

 

  return (
    <div
      id='kt_cart'
      className={`bg-white`}
      data-kt-drawer='true'
      data-kt-drawer-name='cart'
      data-kt-drawer-activate='true'
      data-kt-drawer-overlay='true'
      data-kt-drawer-width="{default:'300px', 'lg': '900px'}"
      data-kt-drawer-direction='end'
      data-kt-drawer-toggle='#kt_cart_toggle'
      data-kt-drawer-close='#kt_cart_close'
    >
      <div className='card shadow-none rounded-0 w-100'>
        <div className='card-header' id='kt_cart_header'>
          <h3 className='card-title fw-bold text-gray-900'>Cart ({count})</h3>

          <div className='card-toolbar'>
            <button
              type='button'
              className='btn btn-sm btn-icon btn-active-light-primary me-n5'
              id='kt_cart_close'
            >
              <KTIcon iconName='cross' iconType='solid' className='fs-1' />
            </button>
          </div>
        </div>
        <div className='card-body position-relative' id='kt_cart_body'>
          <div
            id='kt_cart_scroll'
            className='position-relative scroll-y'
            data-kt-scroll='true'
            data-kt-scroll-height='auto'
            data-kt-scroll-wrappers='#kt_cart_body'
            data-kt-scroll-dependencies='#kt_cart_header, #kt_cart_footer'
            data-kt-scroll-offset='5px'
          >
            {/* cart item here */}
            {/* Begin::Row */}
            {products && products.length > 0 ? (
              <>
                {products.map((product, index) => (
                  <div key={product.product_id} className="card rounded-3 mb-4">
                    <div className="card-body p-4">
                      <div className="row d-flex justify-content-between align-items-center">
                        <div className="col-md-2 col-lg-2 col-xl-2 cart-product-img-container">
                          <img
                            src={product.product_details.product_img_url}
                            className="img-fluid cart-product-img"
                            alt="Cotton T-shirt"
                            height={"30px"}
                          />
                        </div>
                        <div className="col-md-3 col-lg-3 col-xl-3">
                          <p className="lead fw-normal mb-2">{product.product_details.product_name}</p>
                          <p>
                            <span className="text-muted">{product.product_details.product_category}</span>
                          </p>
                        </div>
                        <div className="col-md-3 col-lg-3 col-xl-3 d-flex px-18">
                          <button className="btn btn-link" onClick={() => handleDecrement(product.product_id)}>
                            <i className="fas fa-minus"></i>
                          </button>
                          <input
                            id={`form${index + 1}`}
                            min="0"
                            name="quantity"
                            value={product.qty}
                            type="number"
                            onChange={(e) => handleChanges(product.product_id, e.target.value)}
                            ref={el => {
                              if (el) {
                                inputRefs.current[product.product_id] = el;
                              }
                            }}
                            className="form-control form-control-sm no-spinners mx-2"
                          />
                          <button className="btn btn-link" onClick={() => handleIncrement(product.product_id)}>
                            <i className="fas fa-plus"></i>
                          </button>
                        </div>
                        <div className="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                          <h5 className="mb-0">RM{(product.product_details.product_price * product.qty).toFixed(2)}</h5>
                        </div>
                        <div className="col-md-1 col-lg-1 col-xl-1 text-end pe-10">
                          <a href="#!" className="text-danger">
                            <i className="fas fa-trash fa-lg" onClick={() => handleDeletion(product.product_id)}></i>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                ))}

              </>
            ) : (
              <div>The Cart is empty</div>
            )}
            {/* End::Row */}
            {/* Cart item here */}

          </div>
        </div>
        <div className='card-footer py-5 d-flex flex-row justify-content-between' id='kt_cart_footer'>
          <div className='align-items-center d-flex'>
            <b>Total: RM{total.toFixed(2)}</b>
          </div>
          <button onClick={makePayment} className='btn btn-bg-white text-primary'>
            Proceed to checkout
            <KTIcon iconName='arrow-right' className='fs-3 text-primary' />
          </button>
        </div>
      </div>
    </div>
  )
}

export { CartDrawer }
