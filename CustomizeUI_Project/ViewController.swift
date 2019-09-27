//
//  ViewController.swift
//  CustomizeUI_Project
//
//  Created by ＵＳＥＲ on 2019/9/24.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstPageBtn: UIButton!
    @IBOutlet weak var secondPageBtn: UIButton!
    @IBOutlet weak var thirdPageBtn: UIButton!
    @IBOutlet weak var forthPageBtn: UIButton!
    @IBOutlet weak var fifthPageBtn: UIButton!
    @IBOutlet weak var sixthPageBtn: UIButton!
    @IBOutlet weak var vcView: UIView!
    var arr = [Any]()
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = FirstViewController()
        firstVC.view.backgroundColor = UIColor.red
        let secondVC = FirstViewController()
        secondVC.view.backgroundColor = UIColor.orange
        let thirdVC = FirstViewController()
        thirdVC.view.backgroundColor = UIColor.yellow
        let forthVC = FirstViewController()
        forthVC.view.backgroundColor = UIColor.green
        let fifthVC = FirstViewController()
        fifthVC.view.backgroundColor = UIColor.blue
        let sixthVC = FirstViewController()
        sixthVC.view.backgroundColor = UIColor.purple
        
        arr = [firstVC,secondVC,thirdVC,forthVC,fifthVC,sixthVC]
        let vc = arr[0] as! FirstViewController
        let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(swipeRight(_:)))
        swipeRight.direction = .left
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(swipeLeft(_:)))
        swipeLeft.direction = .right
        self.vcView.addGestureRecognizer(swipeRight)
        self.vcView.addGestureRecognizer(swipeLeft)
        self.vcView.addSubview(vc.view)
    }
    
    @IBAction func pageBtnAction(_ sender: UIButton) {
    
        currentPage = sender.tag
        for vc in self.vcView.subviews {
                   vc.removeFromSuperview()
               }
        let vc = arr[sender.tag] as! FirstViewController
        let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(swipeRight(_:)))
        swipeRight.direction = .left
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(swipeLeft(_:)))
        swipeLeft.direction = .right
        self.vcView.addGestureRecognizer(swipeRight)
        self.vcView.addGestureRecognizer(swipeLeft)
        self.vcView.addSubview(vc.view)
    }
    
    
    @objc func swipeRight(_ recognizer:UISwipeGestureRecognizer){
            print("swipe ok")
        currentPage += 1
        if(currentPage == arr.count) {
            currentPage = 0
        }
        let vc = arr[currentPage] as! FirstViewController
      
        self.vcView.addSubview(vc.view)
    }
    
    @objc func swipeLeft(_ recognizer:UISwipeGestureRecognizer){
            print("swipe ok")
        currentPage -= 1
        if(currentPage < 0) {
            currentPage = 5
        }
        let vc = arr[currentPage] as! FirstViewController
      
        self.vcView.addSubview(vc.view)
    }
}

