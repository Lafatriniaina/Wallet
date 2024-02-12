import { FiSearch } from "react-icons/fi";
import ExchangesCharts from "./charts/ExchangesCharts";
import "./style.css";
import CardsModule from "./CardsModule";
import TableListsDashboard from "./TableListsDashboard";

function ListsScrollDashboard() {
  return (
    <div className="lg:w-[70%] md:w-[60%] sm:w-[90%] h-screen rounded-xl overflow-auto">
        <div className="flex justify-between items-center m-6">
            <p className="text-2xl font-bold">Panorama</p>
          <div className="flex items-center w-[350px] border bg-white border-none rounded-full pl-4 pr-4">
            <input 
              type="search" 
              name="search" 
              placeholder="chercher ici..." 
              className="w-full h-[48px] rounded-full focus:outline-none"
            />
            <FiSearch role="button" className="ml-2 text-slate-600" size={35} />
          </div>
        </div>
        <div className="flex w-wfull h-[180] my-8">
          <CardsModule />
        </div>
        <div className="flex lg:flex-row md:flex-col sm:flex-col items-center justify-around gap-4">
          <div className="account lg:w-1/2 md:w-[90%] sm:w-[90%] h-[300px] rounded-3xl bg-white"></div>
          <div className="average-statistic lg:w-1/2 md:w-[90%] sm:w-[90%] h-[300px] rounded-3xl bg-white">
            <div className="flex m-5 justify-between">
              <p className="font-bold text-lg">Taux de changes</p>
              <p className="font-bold">Année 2023</p>
            </div>
            <div className="exchange-rate-chart w-[95%] h-[220px] overflow-auto ml-3 mb-2">
              <ExchangesCharts />
            </div>
          </div>
        </div>

        <div className="w-auto mt-6 mb-20">
          <TableListsDashboard />
        </div>
    </div>
  )
}

export default ListsScrollDashboard
