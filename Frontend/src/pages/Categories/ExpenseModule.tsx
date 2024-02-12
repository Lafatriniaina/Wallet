/* eslint-disable @typescript-eslint/no-unused-vars */
import { useEffect, useState } from "react";
import { GetCategoriesLists, addCategory } from "../../api/CategoriesApi";
import { getIconDataFromName, getIconeName } from "../../utils/IconsCategories";
import { AnyObject } from "yup";
import { MdErrorOutline, MdEdit, MdDelete, MdAdd } from "react-icons/md";
import ShowDialogCategoriesForm from "../../utils/ShowDialogCategorieForm";
import { IconTypes } from "../../types";

interface CategoryInitialProps {
  name: string;
  iconData: React.ElementType;
  backgroundColor: string; 
  iconColor: string; 
}

function ExpenseModule() {

  const [categories, setCategories] = useState<CategoryInitialProps[]>([]);
  const [isDialogVisible, setIsDialogVisible] = useState(false);

  const openDialog = () => {
      setIsDialogVisible(true);
  }

  const closeDialog = () => {
      setIsDialogVisible(false);
  }

  const colorPairs = [
    ['bg-red-100', 'text-red-900'],
    ['bg-blue-100', 'text-blue-900'],
    ['bg-green-100', 'text-green-900'],
    ['bg-yellow-100', 'text-yellow-900'],
    ['bg-orange-100', 'text-orange-900'],
    ['bg-purple-100', 'text-purple-900'],
    ['bg-pink-100', 'text-pink-900'],
    ['bg-rose-100', 'text-rose-900'],
    ['bg-cyan-100', 'text-cyan-900'],
    ['bg-amber-100', 'text-amber-900'],
  ];

  const addingCategory = async (data: { categorieName: string, iconName: IconTypes }) => {
    const randomColorIndex = Math.floor(Math.random() * colorPairs.length);
    const [backgroundColor, iconColor] = colorPairs[randomColorIndex];
    const stringIcon = getIconeName(data.iconName);
    console.log(stringIcon)
    const newCategory = {
      name: data.categorieName,
      iconData: data.iconName,
      backgroundColor,
      iconColor,
    };
    setCategories([...categories, newCategory]);
    try {
      await addCategory(data.categorieName, "expenses", stringIcon);
    } catch (error) {
      console.error('Erreur lors de l\'ajout de la catégorie: ', error);
    }
  }

  useEffect(() => {
    const loadCategories = async () => {
      try {
        const allCategories = await GetCategoriesLists();
        const typedCategories = allCategories
          .filter((item: AnyObject) => item.category_type === 'expenses')
          .map((category: AnyObject) => {
            const { category_name, icon_name } = category;
            const iconData = getIconDataFromName(icon_name);
            const randomColorIndex = Math.floor(Math.random() * colorPairs.length);
            const [backgroundColor, iconColor] = colorPairs[randomColorIndex];
            
            return {
              ...category,
              name: category_name,
              iconData,
              backgroundColor,
              iconColor
            };
          });
        setCategories(typedCategories);
      } catch (e) {
        console.error('Erreur lors du chargement des catégories: ', e);
      }
    }
    loadCategories();
  }, []);

  return (
    <div className="lg:w-[45%] md:w-[350px] sm:w-[85%]">
      <div 
        className="flex justify-between items-center px-2 w-28 h-12 ms-5 border-[1px] bg-white my-4 text-blue-700"
        role="button"
        onClick={openDialog}
      >
        <MdAdd size={35} />
        <p className="font-bold">Ajouter</p>
      </div>
      {isDialogVisible &&
        <ShowDialogCategoriesForm 
          title="Ajouter une catégorie de dépense"
          handleCloseDialog={closeDialog}
          actionPanel={addingCategory}
          onSubmit={closeDialog}
        />
      }
      <div className="rounded-xl bg-white mx-5">
        <div className="h-[70px] p-5 sticky border-b-[1px] font-bold text-xl">Listes des dépenses</div>
        <div className="lg:h-[70vh] md:h-[400px] sm:h-[350px] overflow-auto">
        {categories.map((category, index) => {
          const backgroundColorClass = category.backgroundColor || 'bg-orange-50';
          const iconColorClass = category.iconColor || 'text-orange-900';
          const name = category.name || 'Dépense';
          const IconComponent = category.iconData ? category.iconData : MdErrorOutline;
            return (
              <div key={index} className="flex w-full items-center justify-between h-[60px] my-3 px-4">
                <div className="flex">
                  <span className={`${backgroundColorClass} w-[60px] h-[60px] flex items-center justify-center rounded-full`}>
                    <IconComponent size={40} className={`${iconColorClass}`} />
                  </span>
                  <span className="inline-block self-center ml-4 font-bold">{name}</span>
                </div>
                <div className="flex gap-4">
                  <div className="flex items-center justify-center w-[45px] h-[45px] rounded-xl bg-yellow-100">
                    <MdEdit size={35} className="text-yellow-800" />
                  </div>
                  <div className="flex items-center justify-center w-[45px] h-[45px] rounded-xl bg-red-100">
                    <MdDelete size={35} className="text-red-800" />
                  </div>
                </div>
              </div>
            );
          })
        }                        
        </div>
      </div>
    </div>
  )
}

export default ExpenseModule;
