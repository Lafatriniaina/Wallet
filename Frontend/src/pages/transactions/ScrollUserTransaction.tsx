/* eslint-disable @typescript-eslint/no-explicit-any */
import { FaBell } from "react-icons/fa6";
import { FiSearch } from "react-icons/fi";
import { IoAddOutline } from "react-icons/io5";
import DropDownUserMenu from "../../components/DropDownUserDescription";
import "../../App.css";
import ShowDialogTransactionForm from "../../utils/ShowDialogTransactionForm";
import { useEffect, useState } from "react";
// import DoughnutChar from "./chartsTransactions/DoughnutChar";
import ModuleTransaction from "./ModuleTransaction";
import { FetchTopGainers, FetchTopLosers } from "../../api/TransactionsApi";

function ScrollUserTransaction() {
    const [isDialogVisible, setIsDialogVisible] = useState(false);
    const [topGainers, setTopGainers] = useState([]);
    const [topLosers, setTopLosers] = useState([]);
    const user_id =  13;

    const openDialog = () => {
        setIsDialogVisible(true);
    }

    const closeDialog = () => {
        setIsDialogVisible(false);
    }

    useEffect(() => {
        FetchTopGainers(user_id)
            .then((data: any) => setTopGainers(data))
            .catch((err: any) => console.error("Erreur lors de la récupération des meilleurs gagnants : ", err));

        FetchTopLosers(user_id)
            .then((data: any) => setTopLosers(data))
            .catch((err: any) => console.error("Erreur lors de la récupération des meilleurs perdants : ", err));
    }, [user_id]);

  return (
    <div className="w-[90%] h-screen rounded-xl overflow-auto">
        <div className="flex lg:flex-row md:flex-col sm:flex-col justify-between items-start gap-y-6 m-6">
            <div className="flex">
            <p className="text-2xl font-bold mr-5">Transactions</p>
            <div className="flex items-center justify-center w-10 h-10 rounded-full bg-blue-950" 
                role="button"
                onClick={openDialog}
            >
                <IoAddOutline size={35} color="white" />
            </div>
            {isDialogVisible &&
                <ShowDialogTransactionForm 
                    title="Ajouter une nouvelle transaction"
                    handleCloseDialog={closeDialog}
                    actionPanel={() => {}}
                    onSubmit={closeDialog}
                />
            }
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

        <ModuleTransaction />

        <div className="grid lg:grid-cols-2 md:grid-cols-1 sm:grid-cols-1 gap-14 mt-8 mr-5">
            <div className="h-[350px] mx-10">
                <p className="font-bold mb-5">Les meilleurs profits</p>
                <div className="flex rounded-lg bg-white h-[300px]">
                    <div className="w-[6px] h-full bg-green-600"></div>
                    <div className="w-full h-full px-6">
                        {
                            topGainers.map((gainer, index) => (
                                <div className="flex justify-between items-center w-full h-1/4" key={index}>
                                    <ul>
                                        <li className="font-bold">{gainer["transaction_type"]}</li>
                                        <li className="text-slate-600">{gainer["category__category_name"]}</li>
                                    </ul>
                                    <ul className="flex flex-col items-end">
                                        <li className="font-bold">Montants</li>
                                        <li className="text-blue-700">{gainer["total"]} MGA</li>
                                    </ul>
                                </div>
                            ))
                        }
                    </div>
                </div>
            </div>
            <div className="h-[350px] mx-10">
                <p className="font-bold mb-5">Les meilleurs pertes</p>
                <div className="flex rounded-lg bg-white h-[300px]">
                    <div className="w-[6px] h-full bg-red-600"></div>
                    <div className="w-full h-full px-6">
                    {
                            topLosers.map((loser, index) => (
                                <div className="flex justify-between items-center w-full h-1/4" key={index}>
                                    <ul>
                                        <li className="font-bold">{loser["transaction_type"]}</li>
                                        <li className="text-slate-600">{loser["category__category_name"]}</li>
                                    </ul>
                                    <ul className="flex flex-col items-end">
                                        <li className="font-bold">Montants</li>
                                        <li className="text-yellow-500">{loser["total"]} MGA</li>
                                    </ul>
                                </div>
                            ))
                        }
                    </div>
                </div>
            </div>
        </div>

        <div className="flex lg:flex-row md:flex-col sm:flex-col items-center justify-center gap-6 w-full h-auto my-10">
            <div className="lg:w-[30%] md:w-[380px] sm:w-[380px] h-[380px] rounded-lg bg-white">
                {/* <DoughnutChar /> */}
            </div>
            <div className="lg:w-[50%] md:w-[500px] sm:w-[500px] h-[380px] rounded-lg bg-white"></div>
        </div>

    </div>
  )
}

export default ScrollUserTransaction
