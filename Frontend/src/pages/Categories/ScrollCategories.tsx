import { FaBell } from "react-icons/fa6"
import DropDownUserMenu from "../../components/DropDownUserDescription"
import ExpenseModule from "./ExpenseModule"
import IncomeModule from "./IncomeModule"
import { FiSearch } from "react-icons/fi"

function ScrollCategories() {
  return (
    <div className="w-[90%] h-screen overflow-auto">
        <div className="flex justify-between items-center mr-5">
          <div className="text-xl font-bold self-start ms-5 mt-6 mb-4">
              Categories
          </div>
          <div className="flex lg:flex-row md:flex-row items-start sm:flex-col gap-y-4">
            <div className="flex items-center w-[350px] border bg-white border-none rounded-full pl-4 pr-4">
              <input 
                type="search" 
                name="search" 
                placeholder="chercher ici..." 
                className="w-full h-[48px] rounded-full focus:outline-none"
              />
              <FiSearch role="button" className="ml-2 text-slate-600" size={35} />
            </div>
            <div className="flex justify-evenly items-center w-[300px] lg:ml-10 md:ml-10">
              <div className="flex items-center justify-center w-[45px] h-[45px] rounded-full bg-black">
                <FaBell size={28} className="text-white" />
              </div>
              <p className="font-bold mr-1">Lafatra Niaina</p>
                <DropDownUserMenu />
            </div>
          </div>
        </div>
        <div className="flex items-center lg:flex-row md:flex-row sm:flex-col sm:gap-6 mb-8">
            <ExpenseModule />
            <IncomeModule />
        </div>
    </div>
  )
}

export default ScrollCategories
