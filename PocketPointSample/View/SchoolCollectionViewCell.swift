//
//  SchoolCollectionViewCell.swift
//  PocketPointSample
//
//  Created by ajie on 27/04/2017.
//  Copyright © 2017 ajie. All rights reserved.
//

import UIKit

class SchoolCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numbersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var school: SchoolModel? {
        didSet {
            guard let school = school else { return }
            nameLabel.text = school.name
            numbersLabel.text = "\(school.numberOfStudents!) students"
            print("is high school \(school.isHighSchool)")
            print("Date \(school.date!)")
        }
    }


}
