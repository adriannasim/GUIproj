import { useIntl } from 'react-intl'
import { PageTitle } from '../../../_metronic/layout/core'
import axios from 'axios';
import { useEffect, useState } from 'react';

interface Product {
    product_id: string;
    product_name: string;
    product_price: number;
    product_desc: string;
    product_img_url: string;
    product_category: string;
    product_added_date: Date;
}

const AllProductsPage = ({ products }: { products: Product[] }) => (

    <>
    {/* begin::Row */}
    {products ? (
        <div className='row g-5 g-xl-8'>
            {products.map((product) => (
                <div key={product.product_id} className='col-xl-3 col-md-6'>
                    <div className={`card`}>
                        {/* begin::Body */}
                        <div className='card-body d-flex flex-column'>
                            <div className='flex-grow-1 product-img-container'>
                                <img src={product.product_img_url} className='product-img' alt={product.product_name} />
                            </div>

                            <div className='pt-5'>
                                <p className='fs-4'>
                                    <b>{product.product_name}</b>
                                </p>
                                <p className='fs-6'>
                                    <span className='badge badge-light fs-8'>{product.product_category}</span>
                                </p>
                                <p className='fs-6 d-flex justify-content-between'>
                                    RM {product.product_price.toFixed(2)}

                                    <a href={`product-page/${product.product_id}`} className='view-button'>
                                        <b>View</b>
                                    </a>
                                </p>
                            </div>
                        </div>
                        {/* end::Body */}
                    </div>
                </div>
            ))}
        </div>
    ) : (
        <div>The product list is empty</div>

    )}

    {/* end::Row */}



</>
)

const AllProductsPageWrapper = () => {
    const intl = useIntl()
    const [products, setProducts] = useState<Product[]>([]);

    useEffect(() => {
        axios.get('http://localhost:3000/apiRouter/getProducts')
        .then(response => setProducts(response.data.products))
            .catch(err => console.log('Axios error:', err));
    }, []);

    return (
        <>
            <PageTitle breadcrumbs={[]}>All Products</PageTitle>
            <AllProductsPage products={products}  />
        </>
    )
}

export { AllProductsPageWrapper }
