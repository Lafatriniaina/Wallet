/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable react-hooks/exhaustive-deps */
import React, { useState, useRef, useEffect } from 'react';
import { createPortal } from 'react-dom';
import iconsLists from './IconsCategories';
import { IconTypes } from '../types';
interface ActionProps {
    title: string;
    handleCloseDialog: () => void;
    actionPanel: (data: { categorieName: string, iconName: IconTypes }) => void;
    onSubmit: () => void;
}

function ShowDialogCategoriesForm(props: ActionProps) {
    const [categorieName, setCategorieName] = useState("");
    const [iconName, setIconName] = useState<IconTypes | undefined>(undefined);
    const [selectedIcon, setSelectedIcon] = useState<IconTypes | undefined>(undefined);
    
    const portalRoot = useRef(document.createElement('div'));

    const handleIconClick = (icon: IconTypes) => {
        setSelectedIcon(icon);
        setIconName(icon);
    }

    useEffect(() => {
        document.body.appendChild(portalRoot.current);

        return () => {
        document.body.removeChild(portalRoot.current);
        };
    }, []);

    const handleSubmit = (event: React.FormEvent) => {
        event.preventDefault();
        if (categorieName && iconName) {
            props.actionPanel({ categorieName, iconName });
        }
        props.onSubmit();
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
                    <div className="h-[70px] sticky mb-4">
                        <label htmlFor="account" className="block text-gray-700 text-sm font-bold mb-2">Nom du catégorie</label>
                        <input type="text" id="account" value={categorieName} 
                            onChange={(e) => setCategorieName(e.target.value)} 
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        />
                    </div>
                    <p className="text-gray-700 text-sm font-bold mb-2">Chiosir entre les icons</p>
                    <div className="w-full h-[250px] overflow-auto p-4 mt-4 mb-8">
                        <div className="grid grid-cols-4 gap-6 text-yellow-900">
                            {
                                Object.values(iconsLists).map((IconComponent, index) => {
                                    const isSelected = selectedIcon === IconComponent;
                                    const iconClass = isSelected ? 'py-4 pl-5 rounded-full bg-yellow-400' : '';
                                    return (
                                        <div 
                                            key={index} 
                                            className={iconClass}
                                            onClick={() => {
                                                handleIconClick(IconComponent);
                                            }}
                                        >
                                            <IconComponent size={35} />
                                        </div>
                                    );
                                })
                            }
                        </div>
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

export default ShowDialogCategoriesForm;
