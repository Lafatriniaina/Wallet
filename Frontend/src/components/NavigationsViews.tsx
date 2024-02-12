/* eslint-disable @typescript-eslint/no-explicit-any */
import { FunctionComponent, useState } from 'react'
import logo from '../assets/logo.png';
import { HiOutlineHome } from "react-icons/hi2";
import { MdOutlinePerson, MdLocalAtm, MdLogout } from "react-icons/md";
import { BiCategory } from "react-icons/bi";
import { RiStockLine } from "react-icons/ri";
import classNames from 'classnames';
import { LuWallet, LuSettings } from "react-icons/lu";
import { NavLink } from 'react-router-dom';
import "./../pages/dashboards/style.css";
import { useAuth } from '../hooks/auth';

interface ListItemProps {
 Icon: any;
 name: string;
 index: number;
 focusedIndex: number;
 focusEvent: (event: React.MouseEvent<HTMLAnchorElement>) => void;
}

const ListItems: FunctionComponent<ListItemProps> = ({ Icon, name, index, focusEvent }) => (
  <NavLink 
    to={`/${name}`} 
    className={({ isActive }) => classNames("flex h-16 mx-2 items-center", {
      "bg-gray-200 rounded-s-full": isActive
    })}
    onMouseEnter={focusEvent}
  >
    <div data-index={index} className="flex h-16 mx-2 items-center">
      <Icon size={35} className="mx-3 text-gray-600" />
      <p className="font-bold text-gray-600 lg:block md:hidden sm:hidden">{name}</p>
    </div>
  </NavLink>
);

const NavigationsViews: FunctionComponent = () => {
 const [focusedIndex, setFocusedIndex] = useState(-1);
 const {logout} = useAuth();

 const focusEventState = (_event: React.MouseEvent<HTMLAnchorElement>, index: number) => {
 setFocusedIndex(index);
 };

 const listItems = [
 { Icon: HiOutlineHome, name: 'Accueil' },
 { Icon: MdOutlinePerson, name: 'Compte' },
 { Icon: BiCategory, name: 'Catégories' },
 { Icon: LuWallet, name: 'Transactions' },
 { Icon: MdLocalAtm, name: 'Revenus' },
 { Icon: RiStockLine, name: 'Stocks' },
 { Icon: LuSettings, name: 'Paramètres' },
 ];
 
 return (
 <div className="lg:w-[300px] md:w-[100px] sm:w-[100px] h-screen bg-white me-5 overflow-auto">
   <div className="flex flex-row ml-6 mb-10 mt-6 items-center">
     <img src={logo} alt="logo" className="w-12 mb-3 me-4" />
     <h3 className="text-xl font-bold lg:block md:hidden sm:hidden">Pocket Wallet</h3>
   </div>
   {listItems.map((item, index) => (
     <ListItems 
       key={index} 
       Icon={item.Icon} 
       index={index} 
       focusedIndex={focusedIndex} 
       name={item.name} 
       focusEvent={(event) => focusEventState(event, index)} 
     />
   ))}
   <hr />
   <div className="flex h-10 mx-2 items-center mt-5" role="button" onClick={logout}>
      <div className="flex h-16 mx-2 items-center">
        <meta name="csrf-token" content="{{ csrf_token() }}" />
        <MdLogout size={35} className="mx-3 text-gray-600" />
        <p className="font-bold text-gray-600 lg:block md:hidden sm:hidden">Se déconnecter</p>
      </div>
   </div>
 </div>
 );
}

export default NavigationsViews
