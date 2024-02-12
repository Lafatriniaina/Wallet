import { IoEllipsisVerticalSharp } from "react-icons/io5";
import { SiGoogleanalytics } from "react-icons/si";
import StatIcon from "../../assets/svg/StatIcon.svg";

function ModuleTransaction() {
  return (
    <div className="flex justify-center gap-6 mt-8 mr-5 w-full h-[180px] overflow-x-auto">
        <div className="rounded-lg w-[300px] h-[180px] px-3 py-2 bg-white">
            <div className="flex justify-between items-center">
                <div className="flex items-center">
                    <div className="w-12 h-12 flex items-center justify-center rounded-lg bg-purple-100">
                    <SiGoogleanalytics size={30} className="text-purple-900" />
                    </div>
                    <p className="font-bold text-xl ms-3">lorem ipsum</p>
                </div>
                <IoEllipsisVerticalSharp size={28} />
            </div>
            <div className="h-[110px] flex justify-between items-end">
                <div className="grid gap-4">
                    <p className="text-sm text-slate-500">Lorem ipsum dolor sit </p>
                    <div className="flex justify-around w-[100px] h-12 rounded-md bg-red-200">

                    </div>
                </div>
                <img src={StatIcon} alt="stat" className="bg-green-100" />
            </div>
        </div>
        <div className="rounded-lg w-[300px] h-[180px] bg-white"></div>
        <div className="rounded-lg w-[300px] h-[180px] bg-white"></div>
        <div className="rounded-lg w-[300px] h-[180px] bg-white"></div>
    </div>
  )
}

export default ModuleTransaction;
