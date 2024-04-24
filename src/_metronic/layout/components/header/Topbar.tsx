
import { FC, useRef } from 'react'
import clsx from 'clsx'
import { KTIcon } from '../../../helpers'
import { Link } from 'react-router-dom'
import { HeaderUserMenu } from '../../../partials'
import { useAuth } from '../../../../app/modules/auth'
import { useEffect, useState } from 'react'
import axios from 'axios'

const toolbarButtonMarginClass = 'ms-1 ms-lg-3',
  toolbarButtonHeightClass = 'btn-active-light-primary btn-custom w-30px h-30px w-md-40px h-md-40p',
  toolbarUserAvatarHeightClass = 'symbol-30px symbol-md-40px',
  toolbarButtonIconSizeClass = 'fs-3'

const Topbar: FC = () => {
  const { currentUser } = useAuth()

  const [count, setCount] = useState(0);

  useEffect(() => {
    if (currentUser && currentUser.cart_id) {
      axios.get(`http://localhost:3000/apiRouter/getCartItemCount/${currentUser.cart_id}`)
        .then(response => setCount(response.data.count))
        .catch(err => console.log('Axios error:', err));
    }
  }, [currentUser]);

 

  return (
    <div className='d-flex align-items-stretch flex-shrink-0'>
      <div className='topbar d-flex align-items-stretch flex-shrink-0'>
        {/* Search */}
        {/* <div className={clsx('d-flex align-items-stretch', toolbarButtonMarginClass)}>
          <Search />
        </div> */}

        {/* Cart */}
        <div className={clsx('d-flex align-items-center ', toolbarButtonMarginClass)}>
          {/* begin::Drawer toggle */}
          <div
            className={clsx(
              'btn btn-icon btn-active-light-primary btn-custom',
              toolbarButtonHeightClass
            )}
            id='kt_cart_toggle'
          >
            <KTIcon iconName='handcart' iconType='outline' className={toolbarButtonIconSizeClass} />
            {count !== 0 &&
              <div className='cart-number-container'><span className='cart-number-content'>{count}</span></div>
            }

          </div>
          {/* end::Drawer toggle */}
        </div>

        {/* NOTIFICATIONS */}
        {/* <div className={clsx('d-flex align-items-center', toolbarButtonMarginClass)}> */}
        {/* begin::Menu- wrapper */}
        {/* <div
            className={clsx(
              'btn btn-icon btn-active-light-primary btn-custom',
              toolbarButtonHeightClass
            )}
            data-kt-menu-trigger='click'
            data-kt-menu-attach='parent'
            data-kt-menu-placement='bottom-end'
            data-kt-menu-flip='bottom'
          >
            <KTIcon iconName='element-plus' className={toolbarButtonIconSizeClass} />
          </div>
          <HeaderNotificationsMenu /> */}
        {/* end::Menu wrapper */}
        {/* </div> */}

        {/* CHAT */}
        {/* <div className={clsx('d-flex align-items-center', toolbarButtonMarginClass)}> */}
        {/* begin::Menu wrapper */}
        {/* <div
            className={clsx(
              'btn btn-icon btn-active-light-primary btn-custom position-relative',
              toolbarButtonHeightClass
            )}
            id='kt_drawer_chat_toggle'
          >
            <KTIcon iconName='message-text-2' className={toolbarButtonIconSizeClass} />

            <span className='bullet bullet-dot bg-success h-6px w-6px position-absolute translate-middle top-0 start-50 animation-blink'></span>
          </div> */}
        {/* end::Menu wrapper */}
        {/* </div> */}

        {/* Quick links */}
        {/* <div className={clsx('d-flex align-items-center', toolbarButtonMarginClass)}> */}
        {/* begin::Menu wrapper */}
        {/* <div
            className={clsx(
              'btn btn-icon btn-active-light-primary btn-custom',
              toolbarButtonHeightClass
            )}
            data-kt-menu-trigger='click'
            data-kt-menu-attach='parent'
            data-kt-menu-placement='bottom-end'
            data-kt-menu-flip='bottom'
          >
            <KTIcon iconName='element-11' className={toolbarButtonIconSizeClass} />
          </div>
          <QuickLinks /> */}
        {/* end::Menu wrapper */}
        {/* </div> */}

        {/* begin::Theme mode */}
        {/* <div className={clsx('d-flex align-items-center', toolbarButtonMarginClass)}>
          <ThemeModeSwitcher toggleBtnClass={toolbarButtonHeightClass} />
        </div> */}
        {/* end::Theme mode */}

        {/* begin::User */}
        <div
          className={clsx('d-flex align-items-center', toolbarButtonMarginClass)}
          id='kt_header_user_menu_toggle'
        >
          {!currentUser ? (
            <>
              <Link to='/login' className='btn btn-icon btn-active-light-primary btn-custom'>
                <KTIcon iconName='user' iconType='outline' className={toolbarButtonIconSizeClass} />
              </Link>
            </>) : (
            <>
              <div
                className={clsx(
                  'btn btn-icon btn-active-light-primary btn-custom',
                  toolbarButtonHeightClass
                )}
                data-kt-menu-trigger='click'
                data-kt-menu-attach='parent'
                data-kt-menu-placement='bottom-end'
                data-kt-menu-flip='bottom'
              >
                <KTIcon iconName='user' iconType='outline' className={toolbarButtonIconSizeClass} />
              </div>
              <HeaderUserMenu />
            </>
          )}

        </div>
        {/* end::User */}






      </div>
    </div>
  )
}

export { Topbar }
