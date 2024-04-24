
import clsx from 'clsx'
import { useState } from 'react'
import { FilterModal } from '../../../partials/modals/filter/FilterModal'
import { useLayout } from '../../core'
import { DefaultTitle } from '../header/page-title/DefaultTitle'
import { useLocation } from 'react-router-dom'

const Toolbar1 = () => {
  const { classes } = useLayout();
  const { pathname } = useLocation();
  const [showFilterModal, setShowFilterModal] = useState<boolean>(false);

  return (
    <>
      <div className='toolbar py-5 py-lg-15' id='kt_toolbar'>
        {/* begin::Container */}
        <div
          id='kt_toolbar_container'
          className={clsx(classes.toolbarContainer.join(' '), 'd-flex flex-stack')}
        >
          <DefaultTitle />

          {/* begin::Actions */}
          <div className='d-flex align-items-center py-1'>
            {/* begin::Wrapper */}
            <div className='me-4'>
              {/* begin::Menu */}
              {pathname === "/main" && (
                <a
                  href='/all-product'
                  className='btn btn-custom btn-active-white btn-flex btn-color-white btn-active-color-white'
                  data-kt-menu-trigger='click'
                  data-kt-menu-placement='bottom-end'
                  data-kt-menu-flip='top-end'
                >
                  View All Products
                </a>)}

              {pathname === "/all-product" && (

                <a
                  className='btn btn-custom btn-active-white btn-flex btn-color-white btn-active-color-white'
                  id='kt_toolbar_primary_button'
                  data-bs-theme='light'
                  onClick={() => setShowFilterModal(true)}
                >
                  Filter
                </a>
              )}

              {/* end::Menu */}
            </div>
            {/* end::Wrapper */}

            {/* begin::Button */}

            {/* <a
              className='btn bg-body btn-active-color-primary'
              id='kt_toolbar_primary_button'
              data-bs-theme='light'
              onClick={() => setShowFilterModal(true)}
            >
              Create
            </a> */}
            {/* end::Button */}
          </div>
          {/* end::Actions */}
        </div>
        {/* end::Container */}
      </div>
      <FilterModal show={showFilterModal} handleClose={() => setShowFilterModal(false)} />
    </>
  )
}

export { Toolbar1 }
