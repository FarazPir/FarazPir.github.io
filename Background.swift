import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */

//I was assisted Boden, Karthik, Logan, Sophie,
// I assisted Karthik, Sophie, Robbie, 
class Background : RenderableEntity {
    let background : Image
    var canvasSize = Size(width:0, height:0)
    let metarStations = ["K6L4"]
   
    init() {
        guard let backgroundURL = URL(string:"https://www.codermerlin.academy/users/faraz-piracha/Media/us-map.jpg") else {
            fatalError("Failed to create URL for background")
        }
        
        background = Image(sourceURL:backgroundURL)
        
          // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
        
    }
    override func setup(canvasSize:Size, canvas:Canvas) {   
        
        
        canvas.setup(background)
        self.canvasSize = canvasSize
        
    }
    
     

    func renderBackground(to canvas: Canvas) {
        if let canvasSize = canvas.canvasSize, background.isReady {                   
            background.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:canvasSize))
            canvas.render(background)            
        }
    }

    func convertToPixels(longitude: Double, latitude: Double,
                         topLeftLongitude: Double, topLeftLatitude: Double,
                         bottomRightLongitude: Double, bottomRightLatitude: Double
    ) -> DoublePoint {
        
        // calculate the total width and height of the image in pixels
        let widthInPixels = Double(1333*((canvasSize.height)/522))
        let heightInPixels = Double(canvasSize.height)
        
        let xDistanceFromTopLeft = (longitude - topLeftLongitude) / (bottomRightLongitude - topLeftLongitude) * widthInPixels
        let yDistanceFromTopLeft = (latitude - topLeftLatitude) / (bottomRightLatitude - topLeftLatitude) * heightInPixels
        
        let pixelX = xDistanceFromTopLeft
        let pixelY = yDistanceFromTopLeft

        // create and return the resulting point
        return DoublePoint(x: Double(pixelX), y: Double(pixelY))
    }

   

    func renderMetar(to canvas: Canvas,metarFile: String, metarStation: String) {
        let currentMetar = Metars(filePath:metarFile).metars[metarStation]!
        
        
        let longitude = currentMetar.longitude
        let latitude = currentMetar.latitude
        
        let point = convertToPixels(longitude: Double(longitude), latitude: Double(latitude), topLeftLongitude: -130.0, topLeftLatitude: 50.0, bottomRightLongitude: -70.0, bottomRightLatitude: 20.0)
        //print(point)
        let radius = 20
        let circle1 = Path(fillMode: .fill)
        let circle2 = Path(fillMode: .fill)
        let cloudCover = currentMetar.sky_cover1 
        if cloudCover == "BKN" {
            circle1.arc(center:Point(point), radius: radius, startAngle: 1.5 * Double.pi, endAngle: 0.5 * Double.pi)
            circle2.arc(center:Point(point), radius: radius, startAngle: 0, endAngle: Double.pi)
        } else if cloudCover == "OVC"{
            circle1.arc(center:Point(point), radius: radius, startAngle: 1.5 * Double.pi, endAngle: 0.5 * Double.pi)
            circle2.arc(center:Point(point), radius: radius, startAngle: 0, endAngle: Double.pi)
        } else if cloudCover == "SCT" {
            circle1.arc(center:Point(point), radius: radius, startAngle: 1.5 * Double.pi, endAngle: 0.5 * Double.pi)
            circle2.arc(center:Point(point), radius: radius, startAngle: 0, endAngle: Double.pi)
        } else if cloudCover == "SKC" {
            circle1.arc(center:Point(point), radius: radius, startAngle: 1.5 * Double.pi, endAngle: 0.5 * Double.pi)
            circle2.arc(center:Point(point), radius: radius, startAngle: 0, endAngle: Double.pi)
        } else if cloudCover == "CLR" {
            circle1.arc(center:Point(point), radius: radius, startAngle: 1.5 * Double.pi, endAngle: 0.5 * Double.pi)
            circle2.arc(center:Point(point), radius: radius, startAngle: 0, endAngle: Double.pi)
        }

        let topLeft = String(currentMetar.temp_c)
        let topRight = String(currentMetar.altim_in_hg)
        let middleLeft = String(currentMetar.visibility_statute_mi)
        let middleRight = String(currentMetar.cloud_base_ft_agl1)
        let bottomLeft = String(currentMetar.dewpoint_c)
        let bottomRight = currentMetar.station_id
        
        let tempText = Text(location:Point(x: Int(point.x - 20), y: Int(point.y + 20)), text:topLeft)
        let altimText = Text(location: Point(x: Int(point.x + 20), y: Int(point.y + 20)), text:topRight)
        let visText =  Text(location: Point(x: Int(point.x - 20), y: Int(point.y)), text: middleLeft)
        let cloudText = Text(location: Point(x: Int(point.x + 20), y: Int(point.y)), text: middleRight)
    let dewText = Text(location: Point(x: Int(point.x - 20), y: Int(point.y - 20)), text: bottomLeft)
    let stationText = Text(location: Point(x: Int(point.x + 20), y: Int(point.y - 20)), text: bottomRight)
    var color:Color
        switch Metars(filePath:metarFile).metars[metarStation]!.flight_category {
        case "VFR":
            color = Color(red: 44, green: 128, blue: 38)
        case "MVFR":
            color = Color(red: 0, green: 49, blue: 245)
        case "IFR":
            color = Color(red: 245, green: 0, blue: 0)
        case "LIFR":
            color = Color(red: 241, green: 10, blue: 245)
        default: 
            color = Color(red: 0, green: 0, blue: 0) 
        }

        let outerFillColor = FillStyle(color:color)
        let textColor = FillStyle(color: Color(.black))


        canvas.render(outerFillColor, circle1,circle2, tempText,textColor, altimText, visText, cloudText, dewText, stationText)
        
          
    }
    
    override func render(canvas:Canvas) {
        if background.isReady {
            renderBackground(to: canvas)
            for station in metarStations {
                renderMetar(to: canvas, metarFile: "Example-metars.csv", metarStation: station)
            }
        }
        
    }
}
