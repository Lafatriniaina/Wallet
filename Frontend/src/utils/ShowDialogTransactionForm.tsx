/* eslint-disable react-hooks/exhaustive-deps */
import React, { useState, useRef, useEffect } from 'react';
import { createPortal } from 'react-dom';

interface ActionProps {
  title: string;
  handleCloseDialog: () => void;
  actionPanel: () => void;
  onSubmit: (data: { account: string, transactionType: string, amount: string, date: string, category: string }) => void;
}

function ShowDialogTransactionForm(props: ActionProps) {
    const [account, setAccount] = useState("");
    const [transactionType, setTransactionType] = useState("");
    const [amount, setAmount] = useState("");
    const [date, setDate] = useState("");
    const [category, setCategory] = useState("");

    const portalRoot = useRef(document.createElement('div'));

    useEffect(() => {
        document.body.appendChild(portalRoot.current);

        return () => {
        document.body.removeChild(portalRoot.current);
        };
    }, []);

    const handleSubmit = (event: React.FormEvent) => {
        event.preventDefault();
        props.actionPanel();
        props.onSubmit({ account, transactionType, amount, date, category });
    }

    return createPortal(
        <div className="fixed z-10 inset-0 overflow-y-auto">
        <div className="flex items-center justify-center min-h-screen">
            <div className="bg-white rounded shadow-lg p-6 m-4 max-w-md w-full">
                <div className="flex justify-between items-center">
                    <h2 className="text-xl font-bold mb-4">{props.title}</h2>
                    <div className="close-dialog" role="button" onClick={props.handleCloseDialog}>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                            <path strokeLinecap="round" strokeLinejoin="round" d="M6 18 18 6M6 6l12 12" />
                        </svg>
                    </div>
                </div>
                <form onSubmit={handleSubmit}>
                    <div className="mb-4">
                        <label htmlFor="account" className="block text-gray-700 text-sm font-bold mb-2">Compte</label>
                        <input type="text" id="account" value={account} 
                            onChange={(e) => setAccount(e.target.value)} 
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        />
                    </div>
                    <div className="mb-4">
                        <label htmlFor="transactionType" className="block text-gray-700 text-sm font-bold mb-2">Type de transaction</label>
                        <input type="text" id="transactionType" 
                            value={transactionType} onChange={(e) => setTransactionType(e.target.value)} 
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                    />
                    </div>
                    <div className="mb-4">
                        <label htmlFor="amount" className="block text-gray-700 text-sm font-bold mb-2">Montant</label>
                        <input type="number" id="amount" 
                            value={amount} onChange={(e) => setAmount(e.target.value)} 
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                    />
                    </div>
                    <div className="mb-4">
                        <label htmlFor="date" className="block text-gray-700 text-sm font-bold mb-2">Date</label>
                        <input type="date" id="date" 
                            value={date} onChange={(e) => setDate(e.target.value)} 
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                    />
                    </div>
                    <div className="mb-4">
                        <label htmlFor="category" className="block text-gray-700 text-sm font-bold mb-2">Catégorie</label>
                        <input type="text" id="category" 
                            value={category} onChange={(e) => setCategory(e.target.value)} 
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                    />
                    </div>
                    <div className="flex justify-end">
                        <button 
                            type="submit" 
                            className="border-gray-500 bg-gray-200 mr-3 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            onClick={() => props.handleCloseDialog}
                        >
                            Annuler
                        </button>
                        <button 
                            type="submit" 
                            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            onClick={() => props.onSubmit}
                        >
                            Soumettre
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div className="absolute -z-10 inset-0 bg-gray-500 opacity-25"></div>
        </div>,
        portalRoot.current
    );
}

export default ShowDialogTransactionForm;
