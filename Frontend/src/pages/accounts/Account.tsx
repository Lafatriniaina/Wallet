import NavigationsViews from '../../components/NavigationsViews'
import ScrollUserAccount from './ScrollUserAccount'
import AsideUserAccount from './AsideUserAccount'

function Account() {
  return (
    <div className="flex bg-slate-100">
      <NavigationsViews />
      <ScrollUserAccount />
      <AsideUserAccount />
    </div>
  )
}

export default Account
