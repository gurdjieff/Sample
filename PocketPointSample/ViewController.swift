//
//  ViewController.swift
//  PocketPointSample
//
//  Created by ajie on 27/04/2017.
//  Copyright © 2017 ajie. All rights reserved.
//

//{
//    "name":"Georgia High",
//    "enabled_at":1472878456,
//    "students":45165,
//    "is_high_school":1
//},


import UIKit
let collectionCell: String = "SchoolCollectionViewCell"

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    fileprivate lazy var schoolsVM : SchoolViewModel = SchoolViewModel()
    @IBOutlet weak var pCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        schoolsVM.requestData(keywords: "hulu") {
            self.pCollectionView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - setupUI
extension ViewController {
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.darkGray
        pCollectionView.register(UINib(nibName: collectionCell, bundle: nil), forCellWithReuseIdentifier: collectionCell)
    }
}

// MARK: - delegate & dataSource
extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schoolsVM.schools.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath) as! SchoolCollectionViewCell
        cell.school = schoolsVM.schools[indexPath.item]
        return cell
    }
    
    @objc(collectionView:layout:sizeForItemAtIndexPath:) public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pCollectionView.frame.size.width, height: 50)
    }
}


