//
//  ThirdVC.swift
//  CustomizeUI_Project
//
//  Created by ＵＳＥＲ on 2019/12/16.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
 
    

    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    let menuArray = [1,2,3,4,5]
    var myArray:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuCollectionView.dataSource = self
        self.myCollectionView.dataSource = self
      
        self.menuCollectionView.register(UINib(nibName: "ThirdCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.myCollectionView.register(UINib(nibName: "ThirdCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.menuCollectionView.delegate = self
    }

    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myCollectionView {
            return myArray.count
        } else {
            return menuArray.count
        }
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ThirdCell
        
        if collectionView == menuCollectionView {
            cell!.backgroundColor = .green
            cell!.titleLabel.text = String(menuArray[indexPath.row])
            
        } else {
            if myArray.count != 0 && myArray.count < menuArray.count{
                cell!.backgroundColor = .brown
                cell!.titleLabel.text = String(myArray[indexPath.row])
            }
           
        }
        return cell!
        
     }
    
    
    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = menuArray[indexPath.row]
        myArray.append(item)
        self.myCollectionView.reloadData()
        
    }
    
    
}
