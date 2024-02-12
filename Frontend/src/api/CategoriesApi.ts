const URI_CATEGORY = 'http://localhost:8000/categories/';

export const GetCategoriesLists = () => {
    return fetch(URI_CATEGORY, {
        method: 'GET',
        headers: {
        'Content-Type': 'application/json; charset=UTF-8'
        }
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('Failed to load categories');
        }
    });
};

export const addCategory = (categoryName: string, categoryType: string, iconName: string) => {
    return fetch(URI_CATEGORY, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({
            category_name: categoryName,
            category_type: categoryType,
            icon_name: iconName
        })
    })
    .then(response => {
        if (response.ok) {
        return response.json();
        } else {
        throw new Error('Error adding category');
        }
    });
};
