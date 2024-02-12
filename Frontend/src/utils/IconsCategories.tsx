import { 
    MdOutlineSportsBar, 
    MdCoffee,
    MdShoppingCart,
    MdDinnerDining,
    MdOutlineSmokingRooms,
    MdWifi,
    MdPhoneEnabled,
    MdOutlineWaterDrop,
    MdDriveEta,
    MdShoppingBag,
    MdOutlineSportsEsports,
    MdCake,
    MdMedicalServices,
    MdMonitor,
    MdAttachMoney,
    MdFacebook,
    MdBusinessCenter,
    MdErrorOutline
} from "react-icons/md";
import { IoLogoTiktok } from "react-icons/io5";
import { SiNetflix } from "react-icons/si";
import { IconTypes } from "../types";

interface IIconLists {
    [key: string]: IconTypes;
    sports_bar_outlined: IconTypes;
    coffee: IconTypes;
    shopping_cart_outlined: IconTypes;
    dinner_dining_rounded: IconTypes;
    smoking_rooms_outlined: IconTypes;
    wifi: IconTypes;
    phone: IconTypes;
    water_drop_outlined: IconTypes;
    drive_eta_outlined: IconTypes;
    shopping_bag_outlined: IconTypes;
    sports_esports_outlined: IconTypes;
    cake_outlined: IconTypes;
    medical_services_outlined: IconTypes;
    monitor: IconTypes;
    attach_money_outlined: IconTypes;
    facebook_outlined: IconTypes;
    tiktok_outlined: IconTypes;
    business: IconTypes;
    netflix: IconTypes;
  }

export const iconsLists: IIconLists = {
  'sports_bar_outlined': MdOutlineSportsBar, 
  'coffee': MdCoffee,
  'shopping_cart_outlined': MdShoppingCart,
  'dinner_dining_rounded': MdDinnerDining,
  'smoking_rooms_outlined': MdOutlineSmokingRooms,
  'wifi': MdWifi,
  'phone': MdPhoneEnabled,
  'water_drop_outlined': MdOutlineWaterDrop,
  'drive_eta_outlined': MdDriveEta,
  'shopping_bag_outlined': MdShoppingBag,
  'sports_esports_outlined': MdOutlineSportsEsports,
  'cake_outlined': MdCake,
  'medical_services_outlined': MdMedicalServices,
  'monitor': MdMonitor,
  'attach_money_outlined': MdAttachMoney,
  'facebook_outlined': MdFacebook,
  'tiktok_outlined': IoLogoTiktok,
  'business': MdBusinessCenter,
  'netflix': SiNetflix
};

export function getIconeName(icon: IconTypes): string {
    switch (icon) {
        case MdOutlineSportsBar:
            return 'sports_bar_outlined';
        case MdCoffee:
            return 'coffee';
        case MdShoppingCart:
            return 'shopping_cart_outlined';
        case MdDinnerDining:
            return 'dinner_dining_rounded';
        case MdOutlineSmokingRooms:
            return 'smoking_rooms_outlined';
        case MdWifi:
            return 'wifi';
        case MdPhoneEnabled:
            return 'phone';
        case MdOutlineWaterDrop:
            return 'water_drop_outlined';
        case MdDriveEta:
            return 'drive_eta_outlined';
        case MdShoppingBag:
            return 'shopping_bag_outlined';
        case MdOutlineSportsEsports:
            return 'sports_esports_outlined';
        case MdCake:
            return 'cake_outlined';
        case MdMedicalServices:
            return 'medical_services_outlined';
        case MdMonitor:
            return 'monitor';
        case MdAttachMoney:
            return 'attach_money_outlined';
        case MdFacebook:
            return 'facebook_outlined';
        case IoLogoTiktok:
            return 'tiktok_outlined';
        case MdBusinessCenter:
            return 'business';
        case SiNetflix:
            return 'netflix';
        default: return 'undefined';
    }
}

export function getIconDataFromName(IconName: string) {
    if (Object.keys(iconsLists).includes(IconName)) {
      return iconsLists[IconName];
    } else {
      return MdErrorOutline; 
    }
}

export default iconsLists;
