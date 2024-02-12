import {
    UilUsdSquare,
    UilMoneyWithdrawal,
    UilClipboardAlt
} from "@iconscout/react-unicons";

export const CardsData = [
    {
        title: "Balances",
        color: {
            backGround: "linear-gradient(180deg, #bb67ff 0%, #c484f3 100%)",
            boxShadow: "0px 10px 20px 0px #e0c6f5",
        },
        barValue: 70,
        value: "25,970",
        png: UilUsdSquare,
        series: [
            {
                name: "Sales",
                data: [31, 40, 28, 51, 42, 109, 100],
            }
        ]
    },
    {
        title: "Revenues",
        color: {
            backGround: "linear-gradient(180deg, #FF919D 0%, #FC929D 100%)",
            boxShadow: "0px 10px 20px 0px #FDC0C7",
        },
        barValue: 80,
        value: "25,970",
        png: UilMoneyWithdrawal,
        series: [
            {
                name: "Revenue",
                data: [10, 100, 50, 70, 80, 30, 40],
            }
        ]
    },
    {
        title: "Dépenses",
        color: {
            backGround: "linear-gradient(180deg, #FFD700  0%, #FFA500  100%)",
            boxShadow: "0px 10px 20px 0px #F9D59B",
        },
        barValue: 50,
        value: "25,970",
        png: UilClipboardAlt,
        series: [
            {
                name: "Expenses",
                data: [10, 100, 50, 70, 80, 30, 40],
            }
        ]
    },
]