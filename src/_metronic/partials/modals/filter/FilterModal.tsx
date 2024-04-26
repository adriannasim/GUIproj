import { useRef, useState } from 'react'
import { createPortal } from 'react-dom'
import { Modal } from 'react-bootstrap'
//import {defaultCreateAppData, ICreateAppData} from './IAppModels'
import { StepperComponent } from '../../../assets/ts/components'
import { KTIcon } from '../../../helpers'


type Props = {
    show: boolean
    handleClose: () => void
}

const modalsRoot = document.getElementById('root-modals') || document.body

const FilterModal = ({ show, handleClose }: Props) => {
    const stepperRef = useRef<HTMLDivElement | null>(null)
    const [stepper, setStepper] = useState<StepperComponent | null>(null)
    //const [data, setData] = useState<ICreateAppData>(defaultCreateAppData)
    const [hasError, setHasError] = useState(false)

    const loadStepper = () => {
        setStepper(StepperComponent.createInsance(stepperRef.current as HTMLDivElement))
    }

    //   const updateData = (fieldsToUpdate: Partial<ICreateAppData>) => {
    //     const updatedData = {...data, ...fieldsToUpdate}
    //     setData(updatedData)
    //   }

    //   const checkAppBasic = (): boolean => {
    //     if (!data.appBasic.appName || !data.appBasic.appType) {
    //       return false
    //     }
    //     return true
    //   }

    //   const checkAppDataBase = (): boolean => {
    //     if (!data.appDatabase.databaseName || !data.appDatabase.databaseSolution) {
    //       return false
    //     }

    //     return true
    //   }

    const prevStep = () => {
        if (!stepper) {
            return
        }

        stepper.goPrev()
    }

    //   const nextStep = () => {
    //     setHasError(false)
    //     if (!stepper) {
    //       return
    //     }

    //     if (stepper.getCurrentStepIndex() === 1) {
    //       if (!checkAppBasic()) {
    //         setHasError(true)
    //         return
    //       }
    //     }

    //     if (stepper.getCurrentStepIndex() === 3) {
    //       if (!checkAppDataBase()) {
    //         setHasError(true)
    //         return
    //       }
    //     }

    //     stepper.goNext()
    //   }

    const submit = () => {
        window.location.reload()
    }

    return createPortal(
        <Modal
            id='kt_modal_create_app'
            tabIndex={-1}
            aria-hidden='true'
            dialogClassName='modal-dialog modal-dialog-centered mw-900px'
            show={show}
            onHide={handleClose}
            onEntered={loadStepper}
            backdrop={true}
        >
            <div className='modal-header'>
                <h2>Filter</h2>
                {/* begin::Close */}
                <div className='btn btn-sm btn-icon btn-active-color-primary' onClick={handleClose}>
                    <KTIcon className='fs-1' iconName='cross' />
                </div>
                {/* end::Close */}
            </div>

            <div className='modal-body py-lg-10 px-lg-10'>
                <form className="form">
                    <table className='w-100'>
                        <tbody>
                            <tr>
                                <td className='align-top'>
                                    <div className="form-group">
                                        <h4>Category</h4>
                                        <div className="checkbox-list">
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                Graduation Attire
                                            </label>
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                Flower Bouquet
                                            </label>
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                Souvenirs
                                            </label>
                                        </div>
                                    </div>
                                </td>
                                <td className='align-top'>
                                    <div className="form-group">
                                        <h4>Pricing</h4>
                                        <div className="checkbox-list">
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                Below RM 20
                                            </label>
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                RM 20 - 40
                                            </label>
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                RM 41 - 60
                                            </label>
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                RM 61 - 80
                                            </label>
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                RM 81 - 100
                                            </label>
                                            <label className="checkbox">
                                                <input type="checkbox" />
                                                Above RM 100
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>



                </form>
            </div>
        </Modal>,
        modalsRoot
    )
}

export { FilterModal }
