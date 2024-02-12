import { createContext, useContext, useEffect, useState } from "react"
import { FormLoginAuthData, UserAuth, UserLogout } from "../api/UserApi"

interface authContext {
    user: FormLoginAuthData | null,
    login: (name: string, email: string, password: string) => Promise<void>,
    logout: () => Promise<void>
}

const Context = createContext<authContext>({} as authContext);

export function AuthProvider({ children }: { children: React.ReactNode }) {
    const [user, setUser] = useState<FormLoginAuthData | null>(null);

    useEffect(() => {
        const isAuthenticated = localStorage.getItem("auth");
        if (isAuthenticated) {
            const auth: { user: FormLoginAuthData } = JSON.parse(isAuthenticated);
            setUser(auth.user);
        }
    }, []);
   
    const login = async (name: string, email: string, password: string) => {
        const response = await UserAuth({ name, email, password });
    
        if (response.success) {
            if (Array.isArray(response.data)) {
                setUser(response.data[0] as FormLoginAuthData);
            } else {
                setUser(response.data as FormLoginAuthData);
            }
            localStorage.setItem("auth", JSON.stringify(response.data));
        } else {
            console.error('Erreur lors de la connexion: ', response.message);
        }
    }

    function getErrorMessage(error: unknown): string {
        if (typeof error === 'string') {
          return error;
        } else if (error instanceof Error) {
          return error.message;
        } else {
          return 'Erreur inconnue';
        }
      }
      
      const logout = async () => {
          try {
              await UserLogout();
              localStorage.removeItem('auth');
              setUser(null);
          } catch (error) {
              console.error('Erreur lors de la déconnexion: ', getErrorMessage(error));
          }
      };

    return (
        <Context.Provider value={{ user, login, logout }}>
          {children}
        </Context.Provider>
    );
}

export function useAuth() {
    const AuthContext = useContext(Context);

    if (!AuthContext) {
        throw new Error();
    }

    return AuthContext;
}
