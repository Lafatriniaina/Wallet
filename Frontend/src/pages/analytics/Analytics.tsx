import { 
  Chart as ChartJS,
  LineElement,
  CategoryScale,
  LinearScale,
  PointElement
} from 'chart.js';
import { Line } from 'react-chartjs-2';

ChartJS.register(
  LineElement,
  CategoryScale,
  LinearScale,
  PointElement
)

const data = {
 labels: ['Jan', 'Fév', 'Mars', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sept', 'Oct', 'Nov', 'Déc'],
 datasets: [{
   data: [0, 100, 200, 300, 400],
   fill: false,
   backgroundColor: '#FF6384',
   borderColor: '#FF6384',
   tension: 0.1
 }]
};

function Analytics() {
  return (
    <Line data={data} options={{ maintainAspectRatio: false }} />
  )
}

export default Analytics
