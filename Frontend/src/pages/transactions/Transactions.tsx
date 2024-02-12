import NavigationsViews from "../../components/NavigationsViews";
import ScrollUserTransaction from "./ScrollUserTransaction";

function Transactions() {
  return (
    <div className="flex bg-slate-100">
      <NavigationsViews />
      <ScrollUserTransaction />
    </div>
  )
}

export default Transactions
