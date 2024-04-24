import { useIntl } from 'react-intl'
import { PageTitle } from '../../../_metronic/layout/core'
import { useEffect, useState } from 'react';
import axios from 'axios';
import { useAuth } from '../../modules/auth';
import BannerCarousel from './BannerCarousel';

const containerStyle: React.CSSProperties = {
    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.3)', // Adjust shadow as per your preference
};


interface Product {
    product_id: string;
    product_name: string;
    product_price: number;
    product_desc: string;
    product_img_url: string;
    product_category: string;
    product_added_date: Date;
}

const MainPage = ({ products }: { products: Product[] }) => (
    <>
        

        {/* begin::Row */}
        <div className='row gy-5 g-xl-8 mt-5'>
            <div className='col-xxl-12'>
                <div
                    className='card-xl-stretch mb-xl-8'>
                    {/* begin::Stats */}
                    <div className='card-p mt-n20 position-relative'>
                        {/* begin::Row */}
                        <div className='row g-0'>

                            {/* begin::Col */}
                            <div style={containerStyle} className='col bg-category px-6 py-8 rounded-2 me-7 mb-7' id='graduation-souvenir'>
                                <a href='#' className='category-text'>
                                    Souvenirs
                                </a>
                            </div>
                            {/* end::Col */}
                            {/* begin::Col */}
                            <div style={containerStyle} className='col bg-category px-6 py-8 rounded-2 me-7 mb-7' id='graduation-attire'>
                                <a href='#' className='category-text'>
                                    Graduation Attire
                                </a>
                            </div>
                            {/* end::Col */}

                            {/* begin::Col */}
                            <div style={containerStyle} className='col bg-category px-6 py-8 rounded-2 me-7 mb-7' id='graduation-flower'>
                                <a href='#' className='category-text'>
                                    Flower Boutique
                                </a>
                            </div>
                            {/* end::Col */}

                        </div>
                        {/* end::Row */}
                    </div>
                    {/* end::Stats */}
                </div>
            </div>

        </div>
        {/* end::Row */}


        <BannerCarousel />
        

        <div>
            <h4>New Products</h4>
        </div>

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

const MainPageWrapper = () => {
    const intl = useIntl();
    const [products, setProducts] = useState<Product[]>([]);
    const { currentUser } = useAuth()

    useEffect(() => {
        axios.get('http://localhost:3000/apiRouter/getLatestProducts')
            .then(response => setProducts(response.data.products))
            .catch(err => console.log('Axios error:', err));
    }, []);




    return (
        <>
            {/* <PageTitle breadcrumbs={[]}>{intl.formatMessage({id: 'MENU.Main'})}</PageTitle> */}
            <PageTitle breadcrumbs={[]}>Welcome to TAR Graduation Store</PageTitle>
            <MainPage products={products} />
        </>
    )
}

export { MainPageWrapper }
