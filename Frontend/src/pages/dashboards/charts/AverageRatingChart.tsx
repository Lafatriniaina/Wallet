import { Doughnut } from 'react-chartjs-2';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
function AverageRatingChart() {


ChartJS.register(ArcElement, Tooltip, Legend);

    const data = {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [
            {
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            borderWidth: 1,
            },
        ],
    };

    return (
        <div>
            <Doughnut data={data} />
        </div>
    )
}

export default AverageRatingChart;
