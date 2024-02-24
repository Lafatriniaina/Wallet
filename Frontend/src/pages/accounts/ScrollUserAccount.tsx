/* eslint-disable @typescript-eslint/no-explicit-any */
import { FiSearch } from 'react-icons/fi'
import { Link } from 'react-router-dom'
import { useEffect, useState } from 'react';
import { FetchAverageBalance } from '../../api/AccountsApi';
import { LatestTransactionsLists } from '../../api/TransactionsApi';

function ScrollUserAccount() {
  const [averageBalance, setAverageBalance] = useState([]);
  const [transactionsLists, setTransactionsLists] = useState([]);
  const user_id = 13;

  useEffect(() => {
    FetchAverageBalance(user_id)
      .then((data: any) => setAverageBalance(data.average_balance))
      .catch((err: any) => console.error("Erreur lors de la récupération des meilleurs gagnants : ", err));
  }, [])

  useEffect(() => {
    LatestTransactionsLists(user_id)
      .then((data: any) => setTransactionsLists(data))
      .catch((err: any) => console.error("Erreur lors de la récupération des meilleurs gagnants : ", err));
  }, [])

  function formatTransactionDate(dateString: any) {
    const options: Intl.DateTimeFormatOptions = {
      weekday: 'short',
      day: 'numeric',
      month: 'short',
      year: 'numeric',
    };
    const formattedDate = new Date(dateString).toLocaleDateString('fr-FR', options);
    return formattedDate;
  }  

  return (
    <div className="lg:w-[70%] md:w-[60%] sm:w-[90%] h-screen rounded-xl overflow-auto">
        <div className="flex justify-between items-center m-6">
            <p className="text-2xl font-bold">Comptes</p>
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

        <div className="flex h-[350px] gap-5 mt-5">
          <div className="w-1/3 rounded-2xl bg-white"></div>
          <div className="w-1/3 rounded-2xl bg-white"></div>
          <div className="w-1/3 rounded-2xl bg-white"></div>
        </div>

        <div className="flex justify-between items-center w-full h-[50px] rounded-xl mt-5 bg-white">
          <div className="flex items-center">
            <div className="px-4 py-2 mx-4 bg-gray-950 rounded-xl font-bold text-white">Envoyer</div>
            <div className="px-4 py-2 border-[2px] border-black rounded-xl font-bold">Remplir à nouveau</div>
            <div className="ms-8 text-gray-700 font-bold">Solde moyenne</div>
          </div>
          <p className="font-bold me-6">{averageBalance} MGA</p>
        </div>

        <div className="h-[310px] bg-white w-full rounded-xl mb-10 pb-[10px]">
          <div className="flex justify-between mt-6 mx-4">
            <p className="font-bold mt-5 text-lg">Transactions récentes</p>
            <Link to="/Transactions">
              <p className="font-bold mt-5 text-lg" role="button">Voir tous</p>
            </Link>
          </div>
          <div className="mt-4 overflow-auto">
            <div className="flex h-12 items-center justify-start">
              <p className="flex items-center w-1/4 ms-4 font-bold">
                <p className="text-red-500">#</p>Types
              </p>
              <p className="flex items-center w-1/4 font-bold">
                <p className="text-red-500">#</p>Dates
              </p>
              <p className="flex items-center w-1/4 font-bold">
                <p className="text-red-500">#</p>Valeurs
              </p>
              <p className="flex items-center w-1/4 font-bold">
                <p className="text-red-500">#</p>Status
              </p>
            </div>
            {transactionsLists.map((transaction, index) => {
              return (
                <div className="flex h-16 items-center justify-start" key={index}>
                  <p className="flex items-center w-1/4 ms-4">
                    <div className="px-4 py-2 rounded-full bg-blue-100 text-blue-950 font-bold text-4xl">
                      {(transaction["transaction_type"] as string).charAt(0).toUpperCase()}
                    </div>
                    <p className="ml-4 text-slate-700">{transaction["transaction_type"]}</p>
                  </p>
                  <p className="w-1/4 text-slate-700">{formatTransactionDate(transaction["date"])}</p>
                  <p className="w-1/4 font-bold">{transaction["amount"]} MGA</p>
                  <p className="w-1/4">
                    { 
                    transaction["category"] == "expenses" ? 
                      (<div className="w-[150px] py-2 px-4 rounded-full bg-red-100 text-center font-bold text-red-700">dépenses</div>) :
                      (<div className="w-[150px] py-2 px-4 rounded-full bg-green-100 text-center font-bold text-green-700">revenus</div>)
                    }
                  </p>
                </div>
              )})
            }
          </div>
        </div>
        
    </div>
  )
}

export default ScrollUserAccount
