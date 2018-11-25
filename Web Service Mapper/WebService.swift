//
//  WebService.swift
//  Web Service
//
//  Created by Omara on 06.11.18.
//  Copyright © 2018 Mahmoud Omara. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SDLoader

class WebService {
    
    
    class func request<T: BaseMappable>(completeURl: String, method: HTTPMethod, params: Parameters?, headers: HTTPHeaders?, onSucces:  @escaping (T) -> Void)  {
        
        Alamofire.request(completeURl, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseObject { (res: DataResponse<T>) in
            if res.result.isSuccess {
//                let sdLoader = SDLoader()
//                sdLoader.startAnimating(atView: atView)
                if res.result.value != nil {
                    onSucces(res.result.value!)
                }
//                sdLoader.stopAnimation()
            } else {
                print("sorry")
            }
        }
    }
}
