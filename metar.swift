import Foundation

class Metar {
    let raw_text: String
    let station_id : String
    let observation_time: String
    let latitude : Float
    let longitude: Float
    let temp_c : Float
    let dewpoint_c : Float
    let wind_dir_degrees : Int
    let wind_speed_kt : Int
    let wind_gust_kt : Int
    let visibility_statute_mi : Float
    let altim_in_hg : Float
    let sea_level_pressure_mb : Float?
    let corrected : Bool
    let auto: Bool
    let auto_station: Bool
    let maintenance_indicator_on: Bool
    let no_signal: Bool
    let lightning_sensor_off: Bool
    let freezing_rain_sensor_off: Bool
    let present_weather_sensor_off: Bool
    let wx_string: String
    let sky_cover1: String
    let cloud_base_ft_agl1: Int
    let sky_cover2: String
    let cloud_base_ft_agl2: Int?
    let sky_cover3: String
    let cloud_base_ft_agl3: Int?
    let sky_cover4: String
    let cloud_base_ft_agl4: Int?
    let flight_category: String
    let three_hr_pressure_tendency_mb: Float
    let maxT_c: Float?
    let minT_c: Float?
    let maxT24hr_c: Float?
    let minT24hr_c: Float?
    let precip_in: Float
    let pcp3hr_in: Float
    let pcp6hr_in: Float
    let pcp24hr_in: Float
    let snow_in: Float
    let vert_vis_ft: Int?
    let metar_type: String
    let elevation_m: Float?

    init?(raw_text: String,station_id : String,observation_time: String,latitude : Float,longitude: Float,temp_c : Float,dewpoint_c : Float,wind_dir_degrees : Int,wind_speed_kt : Int,wind_gust_kt : Int,visibility_statute_mi : Float,altim_in_hg : Float,sea_level_pressure_mb : Float?,corrected : Bool,auto: Bool,auto_station: Bool,maintenance_indicator_on: Bool, no_signal: Bool,lightning_sensor_off: Bool, freezing_rain_sensor_off: Bool,present_weather_sensor_off: Bool,wx_string: String,sky_cover1: String,cloud_base_ft_agl1: Int,sky_cover2: String,cloud_base_ft_agl2: Int?,sky_cover3: String,cloud_base_ft_agl3: Int?,sky_cover4: String
         ,cloud_base_ft_agl4: Int?,flight_category: String,three_hr_pressure_tendency_mb: Float,maxT_c: Float?,minT_c: Float?,maxT24hr_c: Float?,minT24hr_c: Float?,precip_in: Float,pcp3hr_in: Float,pcp6hr_in: Float,pcp24hr_in: Float,snow_in: Float,vert_vis_ft: Int?,metar_type: String ,elevation_m: Float?) {
        self.raw_text = raw_text
        self.station_id = station_id
        self.observation_time = observation_time
        self.latitude = latitude
        self.longitude = longitude
        self.temp_c = temp_c
        self.dewpoint_c = dewpoint_c
        self.wind_dir_degrees = wind_dir_degrees
        self.wind_speed_kt = wind_speed_kt
        self.wind_gust_kt = wind_gust_kt
        self.visibility_statute_mi = visibility_statute_mi
        self.altim_in_hg = altim_in_hg
        self.sea_level_pressure_mb = sea_level_pressure_mb
        self.corrected = corrected
        self.auto = auto
        self.auto_station = auto_station
        self.maintenance_indicator_on = maintenance_indicator_on
        self.no_signal = no_signal
        self.lightning_sensor_off = lightning_sensor_off
        self.freezing_rain_sensor_off = freezing_rain_sensor_off
        self.present_weather_sensor_off = present_weather_sensor_off
        self.wx_string = wx_string
        self.sky_cover1 = sky_cover1
        self.cloud_base_ft_agl1 = cloud_base_ft_agl1
        self.sky_cover2 = sky_cover2
        self.cloud_base_ft_agl2 = cloud_base_ft_agl2
        self.sky_cover3 = sky_cover3
        self.cloud_base_ft_agl3 = cloud_base_ft_agl3
        self.sky_cover4 = sky_cover4
        self.cloud_base_ft_agl4 = cloud_base_ft_agl4
        self.flight_category = flight_category
        self.three_hr_pressure_tendency_mb = three_hr_pressure_tendency_mb
        self.maxT_c = maxT_c
        self.minT_c = minT_c 
        self.maxT24hr_c = maxT24hr_c
        self.minT24hr_c = minT24hr_c
        self.precip_in = precip_in
        self.pcp3hr_in = pcp3hr_in
        self.pcp6hr_in = pcp6hr_in
        self.pcp24hr_in = pcp24hr_in
        self.snow_in = snow_in
        self.vert_vis_ft = vert_vis_ft
        self.metar_type = metar_type
        self.elevation_m = elevation_m
    }

  
    
    convenience init?(fields: [String]) {
        guard fields.count == 44 else {
            print("Unexpected field length, should be 44, got \(fields.count)")
            return nil
        }
        self.init(raw_text : fields[0]
                 ,station_id  : fields[1] 
                 , observation_time : fields[2]
                 , latitude  : Float(fields[3])  ?? 0.0
                 , longitude : Float(fields[4]) ?? 0.0
                 , temp_c  : Float(fields[5]) ?? 0.0
                 , dewpoint_c  : Float(fields[6]) ?? 0.0
                 , wind_dir_degrees  : Int(fields[7]) ?? 0
                 , wind_speed_kt  : Int(fields[8]) ?? 0
                 , wind_gust_kt  : Int(fields[9]) ?? 0
                 , visibility_statute_mi  : Float(fields[10]) ?? 0.0 
                 , altim_in_hg  : Float(fields[11]) ?? 0.0
                 , sea_level_pressure_mb  : Float(fields[12]) 
                 , corrected  : fields[13] == "TRUE"
                 , auto : fields[14] == "TRUE"
                 , auto_station : fields[15] == "TRUE"
                 , maintenance_indicator_on : fields[16] == "TRUE"
                 , no_signal : fields[17] == "TRUE"
                 , lightning_sensor_off : fields[18] == "TRUE"
                 , freezing_rain_sensor_off : fields[19] == "TRUE"
                 , present_weather_sensor_off : fields[20] == "TRUE"
                 , wx_string : fields[21]
                 , sky_cover1 : fields[22]
                 , cloud_base_ft_agl1 : Int(fields[23]) ?? 0
                 , sky_cover2 : fields[24] 
                 , cloud_base_ft_agl2 : Int(fields[25]) 
                 , sky_cover3 : fields[26]
                 , cloud_base_ft_agl3 : Int(fields[27]) 
                 , sky_cover4 : fields[28]
                 , cloud_base_ft_agl4 : Int(fields[29])
                 , flight_category : fields[30]
                 , three_hr_pressure_tendency_mb : Float(fields[31]) ?? 0.0
                 , maxT_c : Float(fields[32]) 
                 , minT_c : Float(fields[33]) 
                 , maxT24hr_c : Float(fields[34]) 
                 , minT24hr_c : Float(fields[35])
                 , precip_in : Float(fields[36]) ?? 0.0
                 , pcp3hr_in : Float(fields[37]) ?? 0.0
                 , pcp6hr_in : Float(fields[38]) ?? 0.0
                 , pcp24hr_in : Float(fields[39]) ?? 0.0
                 , snow_in : Float(fields[40]) ?? 0.0
                 , vert_vis_ft : Int(fields[41]) ?? 0
                 , metar_type : fields[42]
                 , elevation_m : Float(fields[43]))
    }

    
            
    convenience init?(line: String) {
        self.init(fields: line.components(separatedBy: ","))
    }
           
    
}

extension Metar: CustomStringConvertible {
    var description: String {

        let latitudeDesc : String
        let longitudeDesc : String

        if latitude >= 0  {
            latitudeDesc =   "\(latitude) ∘ N" 
        } else if latitude < 0 {
            latitudeDesc = "\(latitude)∘ S"
        } else {
           latitudeDesc = "Unknown latitude"
        }
        if longitude >= 0 {
            longitudeDesc =  "\(longitude)∘ E"
        } else if longitude < 0 {
            longitudeDesc =  "\(longitude)∘ W" 
        } else {
            longitudeDesc = "Unknown longitude"
        }

        let station : String
        if station_id == "" {
            station = "Unknown Station"
        } else {
            station = station_id
        }

        let time : String
        if observation_time == "" {
            time = "Unknown Time"
        } else {
            time = observation_time
        }
        
        let stationDesc = "Reporting from \(station) " + "at \(latitudeDesc), \(longitudeDesc) on \(time)\n" 

        let tempDesc : String
        if temp_c == nil {
            tempDesc = "\n"
        } else {
            tempDesc = "Temperature is \(temp_c)∘ C\n"
        }
        
        
        let dewpointDesc : String
        dewpointDesc = "Dewpoint is \(dewpoint_c)∘ C\n"
        /*
        if dewpoint_c == nil {
            dewpointDesc = "\n"
        } else {
            dewpointDesc = "Dewpoint is \(dewpoint_c!)∘ C\n"
        }*/
        
        let windDesc : String
        if (wind_dir_degrees == 0) && (wind_gust_kt == 0) {
            windDesc = "Winds are calm\n"
        } else if wind_dir_degrees == 0 {
            windDesc = "Winds coming from variable directions at \(wind_speed_kt) kts\n" 
        } else {
            windDesc = "Winds coming at \(wind_dir_degrees)∘ at \(wind_speed_kt) kts\n" 
        }
        
        let wind_gustDesc = "Wind gust coming at \(wind_gust_kt) kts\n"
        
        let visibilityDesc : String
        /*
        if visibility_statute_mi == nil {
            visibilityDesc = "\n"
        } else {
            visibilityDesc = "\(visibility_statute_mi!) statue mi visible\n"
            }
         */
visibilityDesc = "\(visibility_statute_mi) statue mi visible\n"
        
        return stationDesc + tempDesc + dewpointDesc + windDesc + wind_gustDesc + visibilityDesc 
    }
}
   
      
    
    
