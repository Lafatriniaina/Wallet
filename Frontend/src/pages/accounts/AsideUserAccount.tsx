import { FaBell } from "react-icons/fa";
import profil from "../../assets/profil.jpg";
import { RiSettings4Fill } from "react-icons/ri";
import { useState } from "react";

function AsideUserAccount() {
  const [activeElement, setActiveElement] = useState({} as number[]);

  const handleClickToActive = (id: number) => {
    setActiveElement((prevState: any) => ({...prevState[id], [id]: !prevState[id]}));
  }

  const cryptocurrencies = ["BTC", "USDT", "ETH"];

  return (
    <div className="w-[450px] lg:block md:block sm:hidden h-screen rounded-s-3xl bg-white ms-4">
        <div className="flex justify-evenly items-center h-[60px] mt-6">
            <p className="font-bold">Lafatra Niaina</p>
            <img src={profil} alt="profile" className="w-[45px] h-[45px] rounded-full -ms-4" />
            <div className="flex items-center justify-center w-[45px] h-[45px] rounded-full bg-black">
                <FaBell size={28} className="text-white" />
            </div>
            <div className="flex items-center justify-center w-[45px] h-[45px] rounded-full bg-black">
                <RiSettings4Fill size={28} className="text-white" />
            </div>
        </div>

        <div className="w-[90%] h-[150px] rounded-2xl bg-orange-700 mx-auto px-6 mt-5">
          <div className="flex pt-4 justify-between">
            <p className="text-xl font-bold text-white">Espèces</p>
            <div className="relative w-12">
              <div className="absolute w-10 h-10 rounded-full bg-red-800 -right-2"></div>
              <div className="absolute w-10 h-10 rounded-full bg-yellow-100 -left-1"></div>
            </div>
          </div>
          <div className="text-xs font-bold text-white mt-8">Votre solde</div>
          <div className="text-2xl font-bold text-white">900.900.000 MGA</div>
        </div>

        <div className="w-[80%] h-[400px] rounded-2xl m-auto mt-7 p-4 bg-slate-100">
          <div className="flex justify-around">
            <p className="font-bold">Achat rapide</p>
            <p className="font-bold">Echange rapide</p>
          </div>
          <div className="flex w-full h-[40px] rounded-full bg-white mt-5">
            {cryptocurrencies.map((currency, index) => (
              <div 
                key={index}
                role="button"
                onClick={() => handleClickToActive(index)}
                className={`flex items-center justify-center w-1/3 h-full rounded-full ${activeElement[index] ? "bg-black" : "bg-white"}`}
              >
                <p className={`text-center w-5 h-5 bg-slate-700 mx-1 rounded-full text-sm font-bold text-white`}>{currency[0]}</p>
                <p className={`text-sm ${activeElement[index] ? "text-white" : "text-black"}`}>{currency}</p>
              </div>
            ))}
          </div>
          <p className="font-bold mt-5">Comptes d'Achat</p>
          <div className="flex items-center justify-between w-full mt-3 h-[50px] px-4 bg-white rounded-xl">
            <p>900.900.231,21</p>
            <p>USD</p>
          </div>
          <p className="font-bold mt-5">Conversion de Devise</p>
          <div className="flex items-center justify-between w-full mt-3 h-[50px] px-4 bg-white rounded-xl">
            <p>900.900.231,21</p>
            <p>USD</p>
          </div>
          <div className="flex justify-between mt-4" role="button">
              <div></div>
              <div className="px-4 py-2 font-bold rounded-lg border-[2px] border-black">Acheter</div>
          </div>
        </div>
    </div>
  )
}

export default AsideUserAccount
