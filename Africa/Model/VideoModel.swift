//
//  VideoModel.swift
//  Africa
//
//  Created by Bartu Kara on 26.09.2023.
//

import Foundation
import SwiftUI

struct Video : Identifiable, Codable {
    let id : String
    let name : String
    let headline : String
    
    // Computed Property
    
    var thumbnail : String{
        "video-\(id)"
    }
}
