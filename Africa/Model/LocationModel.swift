//
//  LocationModel.swift
//  Africa
//
//  Created by Bartu Kara on 26.09.2023.
//

import Foundation
import SwiftUI
import MapKit

struct NationalParkLocation : Codable, Identifiable{
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    // Computed Protery
    
    var location : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
