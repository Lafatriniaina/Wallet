import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import UserDashboard from './pages/dashboards/UserDashboard';
import Account from './pages/accounts/Account';
import Categories from './pages/Categories/Categories';
import Transactions from './pages/transactions/Transactions';
import Settings from './pages/Settings/Settings';
import Analytics from './pages/analytics/Analytics';
import UserSignUp from './pages/users/signUp';
import UserLogin from './pages/users/Login';
import HomePage from './pages/home/HomePage';
import { CookiesProvider } from 'react-cookie';

const AppRouters: React.FC = () => {
    
    return <div>
        <Router>
            <Routes>
                <Route path="/" element={<HomePage />} />
                <Route path="/Accueil" element={<UserDashboard />} />
                <Route path="/Compte" element={<Account />} />
                <Route path="/Catégories" element={<Categories />} />
                <Route path="/Transactions" element={<Transactions />} />
                <Route path="/signup" element={<UserSignUp />} />
                <Route path="/login" element={
                    <CookiesProvider>
                        <UserLogin />
                    </CookiesProvider>} 
                />
                {/* <Route path="/Stocks" element={Stocks} /> */}
                <Route path="/Paramètres" element={<Settings />} />
                <Route path="/Analytics" element={<Analytics />} />
            </Routes>
        </Router>
    </div>
}
export default AppRouters;