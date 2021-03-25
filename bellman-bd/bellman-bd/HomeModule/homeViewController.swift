//
//  homeViewController.swift
//  bellman-bd
//
//  Created by iMac1 on 3/25/21.
//  Copyright © 2021 tashaleh. All rights reserved.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class homeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var actindicator: NVActivityIndicatorView!
    
    @IBOutlet var homeViewModel : homeViewModel!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var hotspotsCollection: UICollectionView!
    
    @IBOutlet weak var attractionCollection: UICollectionView!
    
    @IBOutlet weak var eventsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib1 = UINib(nibName: String(describing: homeCollectionViewCell.self), bundle: nil)
        self.hotspotsCollection.register(nib1, forCellWithReuseIdentifier: "itemCell")
        
        let nib2 = UINib(nibName: String(describing: homeCollectionViewCell.self), bundle: nil)
        self.eventsCollection.register(nib2, forCellWithReuseIdentifier: "itemCell")
        
        let nib3 = UINib(nibName: String(describing: homeCollectionViewCell.self), bundle: nil)
        self.attractionCollection.register(nib1, forCellWithReuseIdentifier: "itemCell")

        self.searchView.layer.cornerRadius = 12.5
        
        self.hotspotsCollection.delegate = self
        self.hotspotsCollection.dataSource = self

        self.eventsCollection.delegate = self
        self.eventsCollection.dataSource = self

        self.attractionCollection.delegate = self
        self.attractionCollection.dataSource = self

        self.getHomeData()
        // Do any additional setup after loading the view.
    }
    
    func getHomeData(){
        
        self.actindicator.startAnimating()
        
        self.homeViewModel.getDataFromApi(onSuccess: { (isSuccess) in
            
            if isSuccess{
                self.hotspotsCollection.reloadData()
                self.eventsCollection.reloadData()
                self.attractionCollection.reloadData()
                self.actindicator.stopAnimating()
            }
            
        }) { (errorMsg) in
            self.actindicator.stopAnimating()
            AlertViewer().showAlertView(withMessage: errorMsg ?? "", onController: self)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension homeViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == hotspotsCollection {
            return self.homeViewModel.hotspotsArr.count
        }else if collectionView == eventsCollection{
            return self.homeViewModel.eventsArr.count
        }else{
            return self.homeViewModel.attractionsArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! homeCollectionViewCell
        if collectionView == hotspotsCollection {
            
            cell.itemName.text = self.homeViewModel.hotspotsArr[indexPath.row].name
            cell.itemCat.text = self.homeViewModel.hotspotsArr[indexPath.row].categories?[0].name
            cell.itemImage.sd_setImage(with: URL(string: self.homeViewModel.hotspotsArr[indexPath.row].profile_photo ?? ""), placeholderImage: UIImage(named: "placeholder"), options: .highPriority, completed: nil)
        
            
            
        }else if collectionView == eventsCollection{
            
            cell.itemName.text = self.homeViewModel.eventsArr[indexPath.row].name
            cell.itemCat.text = self.homeViewModel.eventsArr[indexPath.row].categories?[0].name
            cell.itemImage.sd_setImage(with: URL(string: self.homeViewModel.eventsArr[indexPath.row].profile_photo ?? ""), placeholderImage: UIImage(named: "placeholder"), options: .highPriority, completed: nil)

        }else{
            
            cell.itemName.text = self.homeViewModel.attractionsArr[indexPath.row].name
            cell.itemCat.text = self.homeViewModel.attractionsArr[indexPath.row].categories?[0].name
            cell.itemImage.sd_setImage(with: URL(string: self.homeViewModel.attractionsArr[indexPath.row].profile_photo ?? ""), placeholderImage: UIImage(named: "placeholder"), options: .highPriority, completed: nil)

        }

    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.5, height: collectionView.frame.height )
    }



}
