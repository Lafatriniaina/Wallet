import { FaBell } from "react-icons/fa6";
import profil from "../../assets/profil.jpg";
import { GoArrowUpRight } from "react-icons/go";
import { FunctionComponent } from "react";
import "../../App.css";
import AverageRatingChart from "./charts/AverageRatingChart";

interface TransactionsProps {
  name: string;
  sentence: string;
  date: string;
  mount: string;
}

const ListsTransactions: FunctionComponent<TransactionsProps> = ({name, sentence, date, mount}) => (
  <div className="flex justify-between items-center h-16">
    <div className="flex">
      <div className="w-14 h-14 rounded-full bg-green-100 flex justify-center items-center ml-4">
        <GoArrowUpRight size={35} color="green" />
      </div>
      <div className="ml-3">
        <p className="font-bold text-md">{name}</p>
        <p className="text-slate-600 text-sm">{sentence}</p>
      </div>
    </div>
    <div className="mr-3">
      <p className="font-bold text-md">{mount}</p>
      <p className="text-slate-600 text-sm">{date}</p>
    </div>
  </div>
);

const UserAsideDashboard: FunctionComponent = () => {
  const listsTransactions = [
    {name: "Fournitures scolaires", sentence: "lorem ipsum", date: "13/12/23", mount: "23k MGA"},
    {name: "Eléctricité", sentence: "lorem ipsum", date: "05/02/22", mount: "3k MGA"},
    {name: "Loyer", sentence: "lorem ipsum", date: "27/09/23", mount: "2k MGA"},
    {name: "Carburants", sentence: "lorem ipsum", date: "15/02/23", mount: "250 MGA"},
    {name: "Norritures", sentence: "lorem ipsum", date: "04/04/23", mount: "23k MGA"},
  ];

  return (
    <div className="w-[450px] lg:block md:block sm:hidden h-screen rounded-s-3xl bg-white ms-4 overflow-auto">
      <div className="flex justify-between items-center my-10 mx-5">
        <div className="relative">
          <FaBell size={30}/>
          <div className="absolute top-0 right-0 w-3 h-3 rounded-full bg-purple-950"></div>
        </div>
        <div className="flex items-center">
          <p className="font-semibold me-3">Lafatra Naina</p>
          <div className="w-12 h-12 rounded-lg">
          <img src={profil} alt="profile" className="w-[45px] h-[45px] rounded-full" />
          </div>
        </div>
      </div>

      <div className="w-[90%] h-[150px] rounded-2xl bg-orange-700 mx-auto px-6">
        <div className="flex pt-4 justify-between">
          <p className="text-xl font-bold text-white">Espèces</p>
          <div className="relative w-12">
            <div className="absolute w-10 h-10 rounded-full bg-yellow-100 -left-1"></div>
            <div className="absolute w-10 h-10 rounded-full bg-red-800 -right-2"></div>
          </div>
        </div>
        <div className="text-xs font-bold text-white mt-8">Votre solde</div>
        <div className="text-2xl font-bold text-white">900.900.000 MGA</div>
      </div>

      <div className="mt-8">
        <div className="flex justify-around font-bold">
          <p>Transactions</p>
          <p>Voir plus</p>
        </div>
        <div className="mt-5">
          {listsTransactions.map((item, index) => (
            <ListsTransactions 
              key={index} 
              name={item.name} 
              sentence={item.sentence} 
              date={item.date} 
              mount={item.mount} 
            />
          ))}
        </div>
      </div>

      <div className="w-[90%] h-auto my-8">
        <AverageRatingChart />
      </div>

    </div>
  )
}

export default UserAsideDashboard
