//
//  ProductionCountries.swift
//  Web Service Mapper
//
//  Created by Michael.Magdy on 11/20/18.
//  Copyright © 2018 Michael.Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductionCompaniesDTO: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        logoPath <- map["logo_path"]
        name <- map["name"]
    }
    
    var logoPath: String?
    var name: String?
}
