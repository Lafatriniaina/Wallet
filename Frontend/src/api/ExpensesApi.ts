const URI_CATEGORY = 'http://localhost:8000/expenses/';

export const addExpanseValue = (categoryId: number, amount: string, date: string) => {
    return fetch(URI_CATEGORY, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({
            category_id: categoryId,
            amount: amount,
            date: date,
        })
    })
    .then(response => {
        if (response.ok) {
        return response.json();
        } else {
        throw new Error('Error adding category');
        }
    })
    .catch(err =>console.error("l'erreur est : ", err));
};