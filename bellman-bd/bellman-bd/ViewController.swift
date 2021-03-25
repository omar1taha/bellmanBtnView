//
//  ViewController.swift
//  bellman-bd
//
//  Created by iMac1 on 3/25/21.
//  Copyright © 2021 tashaleh. All rights reserved.
//

import UIKit
import SOTabBar

class ViewController:  SOTabBarController {

    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = UIColor(displayP3Red: 106/255, green: 28/255, blue: 95/255, alpha: 1.0)
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        //1-initialize tab bar controller with 5 tabs using storyboards identifiers
        let homeStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HOME_ID")
        let searchStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SEARCH_ID")
        let btnStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CUP_ID")
        let cupStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CUP_ID")
        let profileStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PROFILE_ID")

        // Do any additional setup after loading the view.
        homeStoryboard.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home_grey_bottom_icon"), selectedImage: UIImage(named: "Home_bottom_icon"))
        searchStoryboard.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search_grey_bottom_icon"), selectedImage: UIImage(named: "search_bottom_icon"))
        btnStoryboard.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "bellman_bottom-icon"), selectedImage: UIImage(named: "bellman_bottom-icon"))
        cupStoryboard.tabBarItem = UITabBarItem(title: "Competion", image: UIImage(named: "Group 100"), selectedImage: UIImage(named: "Combined-Shape@2x"))
        profileStoryboard.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_grey_bottom_icon"), selectedImage: UIImage(named: "profile_bottom_icon"))
        
        viewControllers = [homeStoryboard, searchStoryboard,btnStoryboard,cupStoryboard,profileStoryboard]

    }


}

extension ViewController: SOTabBarControllerDelegate {
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
}
