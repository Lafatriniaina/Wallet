import { FunctionComponent } from 'react'
import NavigationsViews from '../../components/NavigationsViews'
import ListsScrollDashboard from './ListsScrollDashboard'
import UserAsideDashboard from './UserAsideDashboard'

const UserDashboard: FunctionComponent = () => {
  return (
    <div className="flex bg-slate-100">
      <NavigationsViews />
      <ListsScrollDashboard />
      <UserAsideDashboard />
    </div>
  )
}

export default UserDashboard
