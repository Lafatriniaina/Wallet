/* eslint-disable @typescript-eslint/no-explicit-any */
export const FetchAverageBalance = (user_id: number): Promise<any> => {
    return fetch(`http://localhost:8000/accounts/average_balance/?user_id=${user_id}`)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('Error to fetch transaction');
            }
        })
        .catch(err => console.error("Erreur lors de la récupération des meilleurs gagnants : ", err));
}