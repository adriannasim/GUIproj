import {MenuItem} from './MenuItem'
import {MenuInnerWithSub} from './MenuInnerWithSub'
import {useIntl} from 'react-intl'

export function MenuInner() {
  const intl = useIntl()
  return (
    <>
      <MenuItem title='Home' to='/main' />
     
      <MenuInnerWithSub
        title='Products'
        to='/all-product'
        menuPlacement='bottom-start'
        menuTrigger='click'
      >
        <MenuItem title='All Products' to='/all-product' />
        <MenuItem title='Graduation Attire' to='/all-product' />
        <MenuItem title='Flower Boutique' to='/all-product' />
        <MenuItem title='Souvenirs' to='/all-product' />
      
      </MenuInnerWithSub>
    </>
  )
}
