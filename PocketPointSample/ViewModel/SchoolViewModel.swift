//
//  SchoolViewModel.swift
//  PocketPointSample
//
//  Created by ajie on 27/04/2017.
//  Copyright © 2017 ajie. All rights reserved.
//

import UIKit

class SchoolViewModel: NSObject {
    lazy var schools: [SchoolModel] = [SchoolModel]()
    
    func loadSchoolsData(URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping () -> ()) {
        
        NetworkTool.request(type: .GET, urlString: URLString, paramters: parameters) { (result) in
            guard let array = result as? [[String : Any]] else { return }
            for dict in array {
                self.schools.append(SchoolModel(dict: dict))
            }
        
            self.schools.sort(by: { $0.numberOfStudents! > $1.numberOfStudents! })
            finishedCallback()
        }
    }
    
    func requestData(keywords: String, finishedCallBack: @escaping () -> ()) {
        loadSchoolsData(URLString: "https://interview.pocketpoints.com/schools", parameters: nil, finishedCallback: finishedCallBack)
    }


}
