//
//  SchoolModel.swift
//  PocketPointSample
//
//  Created by ajie on 27/04/2017.
//  Copyright © 2017 ajie. All rights reserved.
//

import UIKit

class SchoolModel: NSObject {
    var name : String = ""
    var numberOfStudents : Int?
    var date : Date?
    var isHighSchool = false


    init(dict : [String : Any]) {
        super.init()
        isHighSchool = dict["is_high_school"]! as! Int == 0 ? false : true
        name = dict["name"]! as! String
        numberOfStudents = dict["students"]! as? Int
        date = Date(timeIntervalSince1970: dict["enabled_at"]! as! TimeInterval)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
