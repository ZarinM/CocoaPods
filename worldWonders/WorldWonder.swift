//
//  WorldWonder.swift
//  worldWonders
//
//  Created by Зарина Муратова on 27.12.2025.
//

import Foundation
import SwiftyJSON
struct WorldWonder {
    var name = ""
    var profession = ""
    var picture = ""
    
    init (json: JSON) {
        if let item = json ["name"].string {
            name = item
        }
        if let item = json ["profession"].string {
            profession = item
        }
        if let item = json ["picture"].string {
            picture = item
        }
    }
    
}
