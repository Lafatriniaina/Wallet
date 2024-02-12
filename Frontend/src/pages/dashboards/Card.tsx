import { useState } from "react"
import { motion } from "framer-motion";
import { CircularProgressbar } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';
import "./style.css";
import { UilTimes } from "@iconscout/react-unicons";
import Chart from "react-apexcharts";

interface CardProps {
    title: string;
    color: any;
    barValue: number;
    value: string;
    png: any;
    series: any;
}

function Card(props: CardProps) {

    const [expanded, setExpanded] = useState(false);

    return (
        <>
            {expanded ? (
                <div>
                    <ExpandedCard params={props} setExpanded={() => setExpanded(false)} />
                </div>
            ) : (
                <div>
                    <CompactCard params={props} setExpanded={() => setExpanded(true)} />
                </div>
            )}
        </>
    )
}

function CompactCard({params, setExpanded}: {params: any, setExpanded: any}) {
    const Png = params.png;
    return (
        <motion.div  
            layoutId="CompactCard"
            className="flex h-[180px] py-[1.5rem] px-3 text-white rounded-3xl relative cursor-pointer hover:shadow-none"
            style={{
                background: params.color.backGround,
                boxShadow: params.color.boxShadow,
                flex: 1
            }}
            onClick={setExpanded}
        >
            <div className="flex flex-col justify-between w-[70px] ">
                <span className="text-2xl font-bold">{params.title}</span>
                <CircularProgressbar
                    value={params.barValue}
                    text={`${params.barValue}%`}
                />
            </div>
            <div className="radialBar">
                <Png />
                <span className="text-2xl font-bold">${params.value}</span>
                <span className="text-sm font-bold">Derniéres 24 heures</span>
            </div>
        </motion.div>
    )
}

function ExpandedCard({params, setExpanded}: {params: any, setExpanded: any}) {

    const data = {
        options: {
            chart: {
                height: "auto",
                type: "area",
                dropShadow: {
                    enabeld: false,
                    enabeldOnSeries: undefined,
                    top: 0,
                    left: 0,
                    blur: 3,
                    color: "#000",
                    opacity: 0.35,
                },
                fill: {
                    color:  ["#FFF"],
                    type: "gradient",
                },
                dataLabels: {
                    enabled: false,
                },
                stroke: {
                    curve: "smooth",
                    color: ["white"],
                },
                tooltip: {
                    x: {
                        format: "dd/MM/yy HH:mm",
                    }
                },
                grid: {
                    show: true,
                },
                saxis: {
                    type: "datetime",
                    categories: [
                        "2018-09-19T00:00:00.000Z",
                        "2018-09-19T01:00:00.000Z",
                        "2018-09-19T02:00:00.000Z",
                        "2018-09-19T03:00:00.000Z",
                        "2018-09-19T04:00:00.000Z",
                        "2018-09-19T05:00:00.000Z",
                        "2018-09-19T06:00:00.000Z",
                    ],
                }
            }
        }
    }

    return (
        <motion.div 
            layoutId="ExpandedCard" 
            className="flex absolute flex-col justify-between p-[1rem] w-[60%] h-[70vh] z-50 left-[13rem] rounded-2xl"
            style={{
                background: params.color.backGround,
                boxShadow: params.color.boxShadow,
            }}
        >
            <div className="self-end cursor-pointer text-white" >
                <UilTimes 
                    onClick={setExpanded}
                />
            </div>
            <span className="text-lg font-bold text-white">{params.title}</span>
            <div className="h-[90%] overflow-auto">
                <Chart
                    series={params.series}
                    options={data.options}
                    type="area"
                />
            </div>
            <span>Derniéres 24 heures</span>
        </motion.div>
    )
}

export default Card
