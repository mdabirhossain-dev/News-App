//
//  PlaceNameModels.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 11/10/23.
//

import Foundation

func countryNames() -> [String] {
    let country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
    return country_list
}

func cityNames(countryName: String) -> [String] {
    let citiesBD = ["Dhaka", "Chattogram","Rajshahi" ,"Narayanganj", "Khulna", "Gāzipura", "Rangapukur", "Mymensingh", "Bogra", "Tungi", "Siddhirganj", "Narsingdi", "Sirājganj", "Maijdi"]
    let canadianCities = ["Toronto", "Vancouver", "Montreal", "Calgary", "Ottawa", "Edmonton", "Winnipeg", "Quebec City", "Hamilton", "Halifax", "London", "Victoria", "Mississauga", "Saskatoon", "Regina", "Charlottetown", "St. John's", "Whitehorse", "Yellowknife", "Iqaluit"]
    let argentinaCities = ["Buenos Aires", "Cordoba", "Rosario", "Mendoza", "La Plata", "San Miguel de Tucuman", "Mar del Plata", "Salta", "Santa Fe", "San Juan", "Resistencia", "Corrientes", "Posadas", "Neuquen", "Rio Cuarto"]

    let citys : [String : [String]] = ["Bangladesh": citiesBD, "Canada": canadianCities, "Argentina": argentinaCities]
    
    if let citys = citys[countryName] {
        return citys
    }
    return ["Unknown"]
}

func areaNames(cityName: String) -> [String] {
    let vancouverAreas = ["Downtown Vancouver", "Gastown", "Yaletown", "Kitsilano", "West End", "Mount Pleasant", "Granville Island", "Chinatown", "Coal Harbour", "Kerrisdale", "East Vancouver", "Arbutus Ridge", "Point Grey", "Shaughnessy", "Dunbar-Southlands", "Marpole", "Oakridge", "Riley Park", "Renfrew-Collingwood", "Hastings-Sunrise"]
    let torontoAreas = ["Downtown Toronto", "Scarborough", "North York", "East York", "Etobicoke", "York", "Old Toronto", "Yorkville", "Financial District", "Kensington Market", "Chinatown", "Little Italy", "Harbourfront", "Distillery District", "Entertainment District", "The Annex", "Cabbagetown", "Leslieville", "The Beaches", "High Park"]
    let calgaryAreas = ["Downtown Calgary", "Beltline", "Kensington", "Eau Claire", "Inglewood", "Bridgeland", "Mission", "Chinatown", "East Village", "Sunalta", "Bankview", "Marda Loop", "Mount Royal", "Signal Hill", "Aspen Woods", "Brentwood", "Varsity", "Dalhousie", "Sage Hill", "Panorama Hills"]
    let rajshahiAreas = ["Natore", "Rajshahi", "Sirajganj", "Pabna", "Bogura", "Chapainawabganj", "Naogaon", "Joypurhat"]
    let chittagongAreas = ["Brahmanbaria", "Comilla", "Chandpur", "Lakshmipur", "Noakhali", "Feni", "Khagrachhari", "Rangamati", "Bandarban", "Chittagong", "Cox's Bazar"]
    let dhakaAreas = ["Abdullahpur", "Uttara", "Mirpur", "Pallabi", "Kazipara", "Kafrul", "Agargaon", "Sher-e-Bangla Nagar", "Cantonment area", "Banani", "Gulshan", "Niketan, Gulshan", "Mohakhali", "Bashundhara", "Banasree", "Baridhara", "Uttarkhan", "Dakshinkhan", "Bawnia", "Khilkhet", "Tejgaon", "Farmgate", "Mohammadpur", "Rampura", "Badda", "Satarkul", "Beraid", "Khilgaon", "Vatara", "Gabtali", "Hazaribagh", "Dhanmondi", "Segunbagicha", "Ramna", "Motijheel", "Sabujbagh", "Lalbagh", "Kamalapur", "Kamrangirchar", "Islampur", "Sadarghat", "Wari", "Kotwali", "Sutrapur", "Jurain", "Dania", "Demra", "Shyampur", "Nimtoli", "Matuail", "Paribagh", "Shahbagh", "Paltan"]
    let narayanganjAreas = ["Fatullah", "Adamjee EPZ", "Siddikbazar", "Shiddhirganj", "Sonargaon", "Nayabazar"]
    let khulnaDistricts = [ "Jessore","Satkhira", "Bagerhat", "Chuadanga","Khulna","Jhenaidah", "Magura", "Meherpur", "Narail"]
    let buenosAiresAreas = ["Palermo", "Recoleta", "San Telmo", "La Boca", "Belgrano", "Retiro", "Caballito", "San Cristobal", "Villa Crespo", "Almagro", "Boedo", "Villa Lugano", "Nunez", "Villa Urquiza", "Flores"]
    let cordobaAreas = ["Nueva Cordoba", "Güemes", "Alta Córdoba", "Centro", "General Paz", "San Vicente", "Villa Allende", "Villa Belgrano", "Villa Revol Anexo", "Villa Warcalde", "Barrio Maipú", "Barrio Jardín", "Cerro de las Rosas", "Los Boulevares", "Gral. Bustos"]
    let rosarioAreas = ["Centro", "Puerto Norte", "Macrocentro", "Echesortu", "Pichincha", "Fisherton", "Parque Independencia", "Belgrano", "Villa Urquiza", "Ludueña", "Villa Gobernador Gálvez", "Alberdi", "Río de la Plata", "Refinería San Lorenzo", "San Martín", "Nueva España"]

    let areas: [String: [String]] = ["Dhaka": dhakaAreas,"Narayanganj" : narayanganjAreas,"Khulna": khulnaDistricts, "Chattogram" : chittagongAreas, "Rajshahi": rajshahiAreas, "Vancouver" : vancouverAreas, "Toronto" : torontoAreas, "Calgary" : calgaryAreas, "Buenos Aires": buenosAiresAreas, "Cordoba" : cordobaAreas, "Rosario" : rosarioAreas]

    if let areaNames = areas[cityName] {
        return areaNames
    }
    return ["Unknown"]
}
