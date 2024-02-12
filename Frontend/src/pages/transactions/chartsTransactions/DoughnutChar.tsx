import { Doughnut } from 'react-chartjs-2';

const data = {
    labels: [
      'Red',
      'Blue',
      'Yellow'
    ],
    datasets: [{
      data: [300, 50, 100],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)'
      ],
      hoverOffset: 4
    }]
}

function DoughnutChar() {
  return (
    <div className="w-auto p-2">
        <Doughnut
            data={data}
        />
    </div>
  )
}

export default DoughnutChar


