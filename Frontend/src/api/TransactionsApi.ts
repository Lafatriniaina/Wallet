/* eslint-disable @typescript-eslint/no-explicit-any */
export const FetchTopGainers = (user_id: number): Promise<any> => {
    return fetch(`http://localhost:8000/transactions/top_gainers/?user_id=${user_id}`)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('Error to fetch transaction');
            }
        })
        .catch(err => console.error("Erreur lors de la récupération des meilleurs gagnants : ", err));
}

export const FetchTopLosers = (user_id: number): Promise<any> => {
    return fetch(`http://localhost:8000/transactions/top_losers/?user_id=${user_id}`)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('Error to fetch transaction');
            }
        })
        .catch(err => console.error("Erreur lors de la récupération des meilleurs perdants : ", err));
}