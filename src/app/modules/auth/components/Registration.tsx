import { useState, useEffect, useRef } from 'react'
import { useFormik } from 'formik'
import * as Yup from 'yup'
import clsx from 'clsx'
import { getUserByToken, register } from '../core/_requests'
import { PasswordMeterComponent } from '../../../../_metronic/assets/ts/components'
import { useAuth } from '../core/Auth'
import { Link } from 'react-router-dom'
import axios from 'axios';

interface State {
  state_code: String,
  state_name: String,
}

interface Postcode {
  postcode: String,
  area_name: String,
  post_office: String,
  state_code: String,
}

const initialValues = {
  firstname: '',
  lastname: '',
  email: '',
  phone: '',
  password: '',
  confirmpassword: '',
  addressline: '',
  state: '',
  city: '',
  postcode: '',
  acceptTerms: false,
}

export function Registration() {
  const [loading, setLoading] = useState(false)
  const { saveAuth, setCurrentUser } = useAuth()

  const submitButtonRef = useRef(null);
  const handleClickAndScroll = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const registrationSchema = Yup.object().shape({
    firstname: Yup.string()
      .min(3, 'Minimum 3 symbols')
      .max(50, 'Maximum 50 symbols')
      .required('First name is required'),
    lastname: Yup.string()
      .min(3, 'Minimum 3 symbols')
      .max(50, 'Maximum 50 symbols')
      .required('Last name is required'),
    email: Yup.string()
      .email('Wrong email format')
      .min(3, 'Minimum 3 symbols')
      .max(50, 'Maximum 50 symbols')
      .required('Email is required'),
    phone: Yup.string()
      .matches(/^[0-9]+$/, 'Phone number must contain only digits')
      .matches(/^[0][0-9]+$/, 'Phone number must start with 0')
      .min(10, 'Phone number must be at least 10 digits')
      .max(11, 'Phone number cannot exceed 11 digits')
      .required('Phone number is required'),
    addressline: Yup.string()
      .required('Address Line is required'),
    state: Yup.string()
      .required('State is required'),
    postcode: Yup.string()
      .test('valid-postcode', 'Invalid postcode for selected state', function (value) {
        const selectedState = this.parent.state;
        const stateData = states.find(stateObj => stateObj.state_code === selectedState);
        const postcodesForSelectedState = stateData ? postcodes.filter(postcode => postcode.state_code === stateData.state_code).map(postcode => postcode.postcode) : [];
        const enteredPostcode = value || '';
        return postcodesForSelectedState.includes(enteredPostcode);
      })
      .required('Postcode is required'),
    city: Yup.string()
      .required('City is required')
      .test('valid-city', 'Invalid city for selected state & postcode', function (value) {
        const selectedState = this.parent.state;
        const selectedPostcode = this.parent.postcode;
        const stateData = states.find(stateObj => stateObj.state_code === selectedState);
        const postcodeData = postcodes.find(postcodeObj => postcodeObj.state_code === stateData?.state_code && postcodeObj.postcode === selectedPostcode);
        if (stateData && postcodeData && value === postcodeData.post_office) {
          return true;
        }
        return false;
      }),
    password: Yup.string()
      .min(3, 'Minimum 3 symbols')
      .max(50, 'Maximum 50 symbols')
      .required('Password is required'),
    confirmpassword: Yup.string()
      .min(3, 'Minimum 3 symbols')
      .max(50, 'Maximum 50 symbols')
      .required('Password confirmation is required')
      .oneOf([Yup.ref('password')], "Password and Confirm Password didn't match"),
    acceptTerms: Yup.bool().required('You must accept the terms and conditions'),
  })

  const [states, setStates] = useState<State[]>([]);

  useEffect(() => {
    axios.get('http://localhost:3000/apiRouter/getStates')
      .then(response => setStates(response.data.states))
      .catch(err => console.log('Axios error:', err));
  }, []);

  const [postcodes, setPostcodes] = useState<Postcode[]>([]);

  useEffect(() => {
    axios.get('http://localhost:3000/apiRouter/getPostcodes')
      .then(response => setPostcodes(response.data.postcodes))
      .catch(err => console.log('Axios error:', err));
  }, []);

  const formik = useFormik({
    initialValues,
    validationSchema: registrationSchema,
    onSubmit: async (values, { setStatus, setSubmitting }) => {
      setLoading(true)
      try {
        const { data: auth } = await register(
          values.email,
          values.firstname,
          values.lastname,
          values.phone,
          values.addressline,
          values.state,
          values.postcode,
          values.city,
          values.password,
        )
        saveAuth(auth)
        const { data: user } = await getUserByToken(auth.api_token);
        setCurrentUser(user);
        setStatus({ type: 'success', message: 'Account created successfully!' });
        setTimeout(function () {
          window.location.href = '/main';
        }, 2000);

      } catch (error) {
        console.error(error)
        saveAuth(undefined)
        setStatus({ type: 'danger', message: 'Error has occured.' });
        setSubmitting(false)
        setLoading(false)
      }
      finally {
        handleClickAndScroll();
      }
    },
  })

  useEffect(() => {
    PasswordMeterComponent.bootstrap()
  }, [])

  return (
    <form
      className='form w-75 fv-plugins-bootstrap5 fv-plugins-framework'
      noValidate
      id='kt_login_signup_form'
      onSubmit={formik.handleSubmit}
    >
      {/* begin::Heading */}
      <div className='text-center mb-11'>
        {/* begin::Title */}
        <h1 className='text-white fw-bolder mb-3'>Sign Up</h1>
        {/* end::Title */}
      </div>
      {/* end::Heading */}

      <div className='bg-white rounded p-10 mb-4  pt-15' id='top'>
        {/* start:: Sign up status display */}
        {formik.status && formik.status.type === 'danger' && (
          <div className='mb-lg-15 alert alert-danger'>
            <div className='alert-text font-weight-bold'>{formik.status.message}</div>
          </div>
        )}
        {formik.status && formik.status.type === 'success' && (
          <div className='mb-lg-15 alert alert-success'>
            <div className='alert-text font-weight-bold'>{formik.status.message}</div>
          </div>
        )}
        {/* end:: Sign up status display */}

        {/* begin::Name Form Group*/}
        <div className='d-flex flex-row w-100'>

          {/* begin::Form group Firstname */}
          <div className='w-50 me-4'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>First name</label>
              <input
                placeholder='First name'
                type='text'
                autoComplete='off'
                {...formik.getFieldProps('firstname')}
                className={clsx(
                  'form-control bg-transparent',
                  {
                    'is-invalid': formik.touched.firstname && formik.errors.firstname,
                  },
                  {
                    'is-valid': formik.touched.firstname && !formik.errors.firstname,
                  }
                )}
              />
              {formik.touched.firstname && formik.errors.firstname && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.firstname}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group Firstname */}

          {/* begin::Form group Lastname */}
          <div className='w-50'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>Last name</label>
              <input
                placeholder='Last name'
                type='text'
                autoComplete='off'
                {...formik.getFieldProps('lastname')}
                className={clsx(
                  'form-control bg-transparent',
                  {
                    'is-invalid': formik.touched.lastname && formik.errors.lastname,
                  },
                  {
                    'is-valid': formik.touched.lastname && !formik.errors.lastname,
                  }
                )}
              />
              {formik.touched.lastname && formik.errors.lastname && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.lastname}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group Lastname */}

        </div>
        {/* end::Name Form Group */}

        {/* start::Contact Form Group */}
        <div className='d-flex flex-row w-100'>

          {/* begin::Form group Email */}
          <div className='w-50 me-4'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>Email</label>
              <input
                placeholder='Email'
                type='email'
                autoComplete='off'
                {...formik.getFieldProps('email')}
                className={clsx(
                  'form-control bg-transparent',
                  { 'is-invalid': formik.touched.email && formik.errors.email },
                  {
                    'is-valid': formik.touched.email && !formik.errors.email,
                  }
                )}
              />
              {formik.touched.email && formik.errors.email && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.email}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group Email */}

          {/* begin::Form group Phone */}
          <div className='w-50'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>Phone No.</label>
              <input
                placeholder='Phone No.'
                type='text'
                autoComplete='off'
                {...formik.getFieldProps('phone')}
                className={clsx(
                  'form-control bg-transparent',
                  { 'is-invalid': formik.touched.phone && formik.errors.phone },
                  {
                    'is-valid': formik.touched.phone && !formik.errors.phone,
                  }
                )}
              />
              {formik.touched.phone && formik.errors.phone && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.phone}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group Phone */}

        </div>
        {/* end::Contact Form Group */}


        {/* begin::Address Form Group */}
        <div className='d-flex flex-row w-100'>

          {/* begin::Form group Address line */}
          <div className='w-50 me-4'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>Address Line</label>
              <input
                placeholder='No. building, Street No. etc.'
                type='text'
                autoComplete='off'
                {...formik.getFieldProps('addressline')}
                className={clsx(
                  'form-control bg-transparent',
                  { 'is-invalid': formik.touched.addressline && formik.errors.addressline },
                  {
                    'is-valid': formik.touched.addressline && !formik.errors.addressline,
                  }
                )}
              />
              {formik.touched.addressline && formik.errors.addressline && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.addressline}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group Address line */}

          {/* begin::Form group State */}
          <div className='w-50'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>State</label>
              <select
                placeholder='State'

                {...formik.getFieldProps('state')}
                className={clsx(
                  'form-select bg-transparent',
                  { 'is-invalid': formik.touched.state && formik.errors.state },
                  {
                    'is-valid': formik.touched.state && !formik.errors.state,
                  }
                )}
                onChange={(e) => {
                  formik.handleChange(e);
                  formik.setFieldValue('postcode', ''); // Clear postcode field
                  formik.setFieldValue('city', ''); // Clear city field
                }}
              >
                <option value=''>Select State</option>
                {/* Loop over states array to generate options */}
                {states.map((state, index) => (
                  <option key={index} value={state.state_code + ''}>{state.state_name}</option>
                ))}
              </select>
              {formik.touched.state && formik.errors.state && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.state}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
        {/* end::Form group State */}


        <div className='d-flex flex-row w-100' >

          {/* begin::Form group Postcode */}
          <div className='w-50 me-4'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>Postcode</label>
              <input
                placeholder='Postcode'
                type='text'
                autoComplete='off'
                {...formik.getFieldProps('postcode')}
                className={clsx(
                  'form-control bg-transparent',
                  { 'is-invalid': formik.touched.postcode && formik.errors.postcode },
                  {
                    'is-valid': formik.touched.postcode && !formik.errors.postcode,
                  },
                )}

                onChange={(e) => {
                  formik.handleChange(e);
                  formik.setFieldValue('city', ''); // Clear city field
                }}
              />
              {formik.touched.postcode && formik.errors.postcode && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.postcode}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group Postcode */}

          {/* begin::Form group City */}
          <div className='w-50'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>City</label>
              <input
                placeholder='City'
                type='text'
                autoComplete='off'
                {...formik.getFieldProps('city')}
                className={clsx(
                  'form-control bg-transparent',
                  { 'is-invalid': formik.touched.city && formik.errors.city },
                  {
                    'is-valid': formik.touched.city && !formik.errors.city,
                  }
                )}
              />
              {formik.touched.city && formik.errors.city && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.city}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group City */}

        </div>

        <div className='d-flex flex-row w-100'>

          {/* begin::Form group Country */}
          <div className='w-50'>
            <div className='fv-row mb-8'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>Country</label>
              <div className='py-4'>
                Malaysia
              </div>
            </div>
          </div>
          {/* end::Form group Country */}

        </div>
        {/* end::Address Form group */}

        {/* begin::Password Form group */}
        <div className='d-flex flex-row w-100'>

          {/* begin::Form group Password */}
          <div className='w-50 me-4'>
            <div className='fv-row mb-8' data-kt-password-meter='true'>
              <div className='mb-1'>
                <label className='form-label fw-bolder text-gray-900 fs-6'>Password</label>
                <div className='position-relative mb-3'>
                  <input
                    type='password'
                    placeholder='Password'
                    autoComplete='off'
                    {...formik.getFieldProps('password')}
                    className={clsx(
                      'form-control bg-transparent',
                      {
                        'is-invalid': formik.touched.password && formik.errors.password,
                      },
                      {
                        'is-valid': formik.touched.password && !formik.errors.password,
                      }
                    )}
                  />
                  {formik.touched.password && formik.errors.password && (
                    <div className='fv-plugins-message-container'>
                      <div className='fv-help-block'>
                        <span role='alert'>{formik.errors.password}</span>
                      </div>
                    </div>
                  )}
                </div>
                {/* begin::Meter */}
                <div
                  className='d-flex align-items-center mt-3 w-100'
                  data-kt-password-meter-control='highlight'
                >
                  <div className='flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2'></div>
                  <div className='flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2'></div>
                  <div className='flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2'></div>
                  <div className='flex-grow-1 bg-secondary bg-active-success rounded h-5px'></div>
                </div>
                {/* end::Meter */}
              </div>
              <div className='text-muted'>
                <small>Use 8 or more characters with a mix of letters, numbers & symbols.</small>
              </div>
            </div>
          </div>
          {/* end::Form group Password */}

          {/* begin::Form group Confirm password */}
          <div className='w-50'>
            <div className='fv-row mb-5'>
              <label className='form-label fw-bolder text-gray-900 fs-6'>Confirm Password</label>
              <input
                type='password'
                placeholder='Password confirmation'
                autoComplete='off'
                {...formik.getFieldProps('confirmpassword')}
                className={clsx(
                  'form-control bg-transparent',
                  {
                    'is-invalid': formik.touched.confirmpassword && formik.errors.confirmpassword,
                  },
                  {
                    'is-valid': formik.touched.confirmpassword && !formik.errors.confirmpassword,
                  }
                )}
              />
              {formik.touched.confirmpassword && formik.errors.confirmpassword && (
                <div className='fv-plugins-message-container'>
                  <div className='fv-help-block'>
                    <span role='alert'>{formik.errors.confirmpassword}</span>
                  </div>
                </div>
              )}
            </div>
          </div>
          {/* end::Form group Confirm password */}

        </div>
        {/* end::Password Form group */}


        {/* begin::Term Form group */}
        <div className='w-50 me-2'>
          <label className='form-check form-check-inline' htmlFor='kt_login_toc_agree'>
            <input
              className='form-check-input'
              type='checkbox'
              id='kt_login_toc_agree'
              {...formik.getFieldProps('acceptTerms')}
            />
            <span>
              I Accept the{' '}
              <a
                href='https://keenthemes.com/metronic/?page=faq'
                target='_blank'
                className='ms-1 link-primary'
              >
                Terms
              </a>
              .
            </span>
          </label>
          {formik.touched.acceptTerms && formik.errors.acceptTerms && (
            <div className='fv-plugins-message-container'>
              <div className='fv-help-block'>
                <span role='alert'>{formik.errors.acceptTerms}</span>
              </div>
            </div>
          )}
        </div>
        {/* end::Term Form group */}

        {/* begin::Button Form group */}
        <div className='d-flex flex-row w-100 justify-content-end gap-2'>
          <Link to='/login' className='btn btn-lg btn-light-primary w-25 mb-5' id='kt_login_signup_form_cancel_button'>
            Back
          </Link>
          <button
            type='submit'
            id='kt_sign_up_submit'
            className='btn btn-lg btn-primary w-25 mb-5'
            disabled={formik.isSubmitting || !formik.isValid || !formik.values.acceptTerms}
            onClick={handleClickAndScroll} // Call the scroll function on button click
            ref={submitButtonRef}
          >
            {!loading && <span className='indicator-label'>Submit</span>}
            {loading && (
              <span className='indicator-progress' style={{ display: 'block' }}>
                Please wait...{' '}
                <span className='spinner-border spinner-border-sm align-middle ms-2'></span>
              </span>
            )}
          </button>
        </div>
        {/* end::Button Form group */}

      </div>
    </form >
  )
}
