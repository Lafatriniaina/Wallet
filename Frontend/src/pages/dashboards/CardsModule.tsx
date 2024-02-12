import { CardsData } from "../../data/data"
import Card from "./Card"

function CardsModule() {
  return (
    <div className="flex gap-4 w-full overflow-auto">
      {CardsData.map((card, index) => {
        return (
            <div className="cardParent w-[100%]" key={index}>
                <Card
                    title={card.title}
                    color={card.color}
                    barValue={card.barValue}
                    value={card.value}
                    png={card.png}
                    series={card.series}
                />
            </div>
        )
        })}
    </div> 
  )
}

export default CardsModule
