import { Link, useNavigate } from "react-router-dom";
import logo from "../../assets/logo.png";
import windows from "../../assets/Windows.png";
import { useFormik } from 'formik';
import * as Yup from 'yup';
import { CreateUser, FormUserData } from "../../api/UserApi";

function UserSignUp() {
    const navigation = useNavigate();

    const formik = useFormik<FormUserData>({
        initialValues: {
          name: '',
          firstname: '',
          email: '',
          password: '',
        },
        validationSchema: Yup.object({
            name: Yup.string()
                .required('Le nom est requis'),
            firstname: Yup.string()
                .required('Le prénom est requis'),
            email: Yup.string()
                .email('Adresse email invalide')
                .required('L\'adresse email est requise'),
            password: Yup.string()
                .min(8, 'Le mot de passe doit avoir au moins 8 caractères')
                .required('Le mot de passe est requis'),
        }),
        onSubmit: (values) => {
            CreateUser(values)
                .then(response => {
                    if (response.success) {
                        console.log('Utilisateur créé avec succès');
                        navigation("/Accueil");
                    } else {
                        console.error('Erreur lors de la création de l\'utilisateur: ', response.message);
                    }
                })
                .catch(error => console.error(error));
        },
    });

  return (
    <div className="flex">
        <div className="w-[45%] h-screen overflow-auto form-group">
            <div className="flex flex-col w-[80%] h-[100%] m-auto p-[10px] border-[1px] rounded-md shadow-md justify-center items-center">
                <img src={logo} alt="logo" className="w-[60%]" />
                <div className="w-[70%]">
                    <form onSubmit={formik.handleSubmit} className="flex flex-col my-8">
                        <label htmlFor="name">Nom(s)</label>
                        <input className="h-[50px] mb-4 mt-2 px-3 rounded-2xl focus:outline-none bg-slate-200" id="name" name="name" type="text" onChange={formik.handleChange} value={formik.values.name} />
                        {
                            formik.touched.name && formik.errors.name ? 
                            <div className="text-red-700">{formik.errors.name}</div> : null
                        }

                        <label htmlFor="firstname">Prénom(s)</label>
                        <input className="h-[50px] mb-4 mt-2 px-3 rounded-2xl focus:outline-none bg-slate-200" id="firstname" name="firstname" type="text" onChange={formik.handleChange} value={formik.values.firstname} />
                        {
                            formik.touched.firstname && formik.errors.firstname ? 
                            <div className="text-red-700">{formik.errors.firstname}</div> : null
                        }

                        <label htmlFor="email">Adresse Email</label>
                        <input className="h-[50px] mb-4 mt-2 px-3 rounded-2xl focus:outline-none bg-slate-200" id="email" name="email" type="email" onChange={formik.handleChange} value={formik.values.email} />
                        {
                            formik.touched.email && formik.errors.email ? 
                            <div className="text-red-700">{formik.errors.email}</div> : null
                        }

                        <label htmlFor="password">Mot de passe</label>
                        <input className="h-[50px] mb-4 mt-2 px-3 rounded-2xl focus:outline-none bg-slate-200" id="password" name="password" type="password" onChange={formik.handleChange} value={formik.values.password} />
                        {
                            formik.touched.password && formik.errors.password ? 
                            <div className="text-red-700">{formik.errors.password}</div> : null
                        }

                        <button type="submit" className="px-auto mt-8 py-[15px] rounded-xl text-white font-bold bg-blue-700">
                            S'inscrire
                        </button>
                        <div className="flex my-6">
                            <p className="font-bold pe-4">Avez-vous déjà un compte?</p>
                            <Link to="/login" className="font-bold text-orange-400">
                                S'identifié
                            </Link>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div className="flex flex-col w-[65%] h-screen justify-center items-center">
            <img src={windows} alt="logo" className="w-[40%]" />
            <p className="w-[60%] mt-6">
                Bienvenue dans l'univers captivant de la gestion financière, 
                où chaque transaction devient une étape dans votre voyage vers la prospérité. 
                Dans ce royaume virtuel de chiffres et de transactions, votre portefeuille 
                devient le reflet de vos choix, de vos objectifs et de vos aspirations.
            </p><br />
            <p className="w-[60%]">
                Explorez un design élégant qui transcende l'ordinaire, tout en bénéficiant 
                d'une interface intuitive qui simplifie la navigation au sein de vos actifs et passifs.
            </p>
        </div>
    </div>
  )
}

export default UserSignUp
