import './App.css'
import { AuthProvider } from './hooks/auth';
import AppRouters from './router';

function App() {

  return (
    <AuthProvider>
      <AppRouters />
    </AuthProvider>
  )
}

export default App
