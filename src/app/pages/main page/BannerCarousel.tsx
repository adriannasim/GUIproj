import { Carousel } from 'antd';
import { CSSProperties } from 'react';

const BannerCarousel = () => {

  const contentStyle: CSSProperties = {
    height: '100%',
    border: '0.5px solid white',
    width: '100%',
    borderRadius: '10px 10px 0 0',
    margin: 'auto',
    objectFit: 'cover',
    objectPosition: 'center',
    filter: 'brightness(100%)',
  };

  const containerStyle: CSSProperties = {
    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.3)', // Adjust shadow as per your preference
    borderRadius: '10px', // Match the border radius of your content
    margin: '0 auto 60px auto', // Adjust margin as per your layout
    maxWidth: '90%', // Ensure the carousel container fits within the desired width
    cursor: 'pointer'
  };

  const textStyle: CSSProperties = {
    margin:'10px',
    lineHeight: '1'
  }

  const text1Style: CSSProperties = {
    fontWeight: 'bolder',
    fontSize: '12px'
  }

  const text2Style: CSSProperties = {
    fontWeight: 'normal',
    fontSize: '10px'
  }



  return (
    <div style={containerStyle}>
      {/* Carousel component */}
      <Carousel autoplay>
        <div>
          <img style={contentStyle} src='/media/Graduation/banner-1.png' />
          <div style={textStyle}>
            <span style={text1Style}>TAR GRADUATION STORE</span><br />
            <span style={text2Style}>Your One-Stop Shop for Graduation Essentials</span>
          </div>
        </div>
        <div>
          <img style={contentStyle} src='/media/Graduation/banner-2.png' />
          <div style={textStyle}>
            <span style={text1Style}>TARUMT 2024 CONVOCATION</span><br />
            <span style={text2Style}>Congratulations to All Graduands</span>
          </div>
        </div>
      </Carousel>
    </div>
  );
};

export default BannerCarousel;
