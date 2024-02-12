export type FormUserData = {
    name: string;
    firstname: string;
    email: string;
    password: string;
}

interface UserResponse {
    success: boolean
    data?: FormUserData | FormUserData[]
    message?: string
}

export const CreateUser = (user: FormUserData): Promise<UserResponse> => {
    return new Promise<UserResponse>((resolve, reject) => {
        fetch('http://localhost:8000/users/', {
            method: 'POST',
            headers: {  'Content-Type': 'application/json' },
            body: JSON.stringify(user)
        })
        .then(response => response.json())
        .then(data => resolve({ success: true, data }))
        .catch(err => reject({ success: false, message: err.message }))
    })
}

export type FormLoginAuthData = {
    name: string;
    email: string;
    password: string;
}

export const UserAuth = (user: FormLoginAuthData): Promise<UserResponse> => {
    return new Promise<UserResponse>((resolve, reject) => {
        fetch('http://localhost:8000/login/', {
            method: 'POST',
            credentials: 'include',
            headers: {  'Content-Type': 'application/json' },
            body: JSON.stringify(user)
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                reject({ success: false, message: 'Erreur lors de la connexion' });
            }
        })
        .then(data => {resolve({ success: true, data }); console.log(data)})
        .catch(err => reject({ success: false, message: err.message }))
    })
}

export const UserLogout = (): Promise<UserResponse> => {
    return new Promise<UserResponse>((resolve, reject) => {
        const token = localStorage.getItem("auth");
        if (!token) {
            reject({ success: false, message: 'Aucun token trouvé' });
            return;
        }
        fetch('http://localhost:8000/logout/', {
            method: 'POST',
            credentials: 'include',
            headers: {  
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${token}`
            },
        })
        .then(response => {
            if (response.ok) {
                localStorage.removeItem("auth");
                resolve({ success: true });
            } else {
                response.json().then(data => {
                    reject({ success: false, message: data.message || 'Erreur lors de la déconnexion' });
                });
            }
        })
        .catch(err => reject({ success: false, message: err.message }));
    });
}

