//
//  MovieInfoDTO.swift
//  Web Service Mapper
//
//  Created by Michael.Magdy on 11/20/18.
//  Copyright © 2018 Michael.Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieInfoDTO: Mappable{
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        imagePath <- map["poster_path"]
        productionYear <- map["release_date"]
        rate <- map["vote_average"]
        id <- map["id"]
        genres <- map["genres"]
        productionCompanies <- map["production_companies"]
        overview <- map["overview"]
    }
    
    
    var title: String?
    var imagePath: String?
    var productionYear: String?
    var rate: Double?
    var id: Int?
    var genres: [GenresDTO]?
    var productionCompanies: [ProductionCompaniesDTO]?
    var overview: String?
    
}
