import { useIntl } from 'react-intl';
import { PageTitle } from '../../../_metronic/layout/core';
import { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import { useAuth } from '../../modules/auth';

interface Product {
    product_id: string;
    product_name: string;
    product_price: number;
    product_desc: string;
    product_img_url: string;
    product_category: string;
    product_added_date: Date;
}

const ProductPageWrapper = () => {
    const intl = useIntl();
    const [product, setProduct] = useState<Product | null>(null);
    const { id } = useParams<{ id: string }>();
    const { currentUser } = useAuth()

    useEffect(() => {
        axios.get(`http://localhost:3000/apiRouter/getProductFromId/${id}`) // Correct endpoint name
            .then(response => setProduct(response.data.product)) // Accessing 'product' key from the response object
            .catch(err => console.log('Axios error:', err));
    }, [id]);

    const addToCart = async () => {
        try {
            if (product) {
                const cart_id = currentUser?.cart_id || '';
                const product_id = product.product_id;
                const date_added = new Date();
                const qty = 1;

                await axios.post('http://localhost:3000/apiRouter/addToCart', {
                    cart_id,
                    product_id,
                    qty,
                    date_added
                });
                alert('Product added to cart successfully');
                window.location.reload();
            } else {
                console.error('No product selected');
            }
        } catch (error) {
            console.error('Error adding product to cart:', error);
        }
    };


    const desc = product?.product_desc;
    const description = desc?.split(';');


    return (
        <>
            <PageTitle breadcrumbs={[]}>Product Details</PageTitle>
            {/* Check if product exists before rendering */}
            {product ? (
                <div className='row g-5 g-xl-8'>
                    <div className='col-xl-3 col-md-6'>
                        <div className={`card`}>
                            <div className='card-body d-flex flex-column'>
                                <div className='flex-grow-1 product-img-container'>
                                    <img src={product.product_img_url} className='product-img' alt={product.product_name} />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className='col-xl-9 col-md-9'>
                        <p className='fs-6'>
                            <span className='mt-5 mb-2 badge badge-light fs-8'>{product.product_category}</span>
                        </p>
                        <h1 className='text-white mb-5'>{product.product_name}</h1>
                        <h4 className='text-white mb-10'>RM{product.product_price.toFixed(2)}</h4>
                        <ul className='mt-20'>
                            {description?.map((description_point, index) => (
                                <li key={index}>{description_point}</li>
                            ))}
                        </ul>
                        <button className='btn btn-primary w-50 mt-5' onClick={addToCart}>Add to Cart</button>

                    </div>
                </div>
            ) : (
                <div>The product is not found</div>
            )}
        </>
    );
}

export default ProductPageWrapper;
