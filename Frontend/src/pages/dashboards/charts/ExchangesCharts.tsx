import Chart from "react-apexcharts";
  
function ExchangesCharts() {

    const options = {
        chart: {
          height:  350,
          type: 'area',
          toolbar: {
            show: false
          }
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          curve: 'smooth'
        },
        xaxis: {
          categories: ['', 'Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam']
        },
        yaxis: {
          min:  0,
          max:  100,
          tickAmount:  4,
          labels: {
            formatter: function (val: any) {
              return val ? val + '%' : val;
            }
          }
        },
        tooltip: {
          y: {
            formatter: function (val: any) {
              return val + "%";
            }
          }
        },
        fill: {
          colors: ['rgba(75,192,192,0.2)'],
          type: 'solid',
          gradient: {
            shadeIntensity:  1,
            opacityFrom:  0.7,
            opacityTo:  0.9,
            stops: [0,  100]
          }
        },
        markers: {
          size:  0
        }
      };
      
      const series = [
        {
          name: "Serie  1",
          data: [0,  25,  50,  25,  42.7,  50,  0.4,  50.9]
        }
    ];


    return (
        <div className="h-full">
            <Chart options={options} series={series} type="area" height={350} />
        </div>
    )
}

export default ExchangesCharts
