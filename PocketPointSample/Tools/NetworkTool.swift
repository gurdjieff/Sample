//
//  NetworkTool.swift
//  PocketPointSample
//
//  Created by ajie on 27/04/2017.
//  Copyright © 2017 ajie. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTool {
    class func request(type: MethodType, urlString: String, paramters: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        // get type
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        // send request
        Alamofire.request(urlString, method: method, parameters: paramters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            // call back
            finishedCallback(result as AnyObject)
        }
    }
}
