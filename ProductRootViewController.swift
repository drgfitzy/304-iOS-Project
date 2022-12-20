//
//  ProductRootViewController.swift
//  304#
//
//  Created by Greg Fitzgibbon on 09/11/2015.
//  Copyright © 2015 Greg Fitzgibbon. All rights reserved.
//

import UIKit

class ProductRootViewController: UIViewController {

    @IBOutlet weak var homeImage: UIImageView!
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        homeImage.animationImages = [
            UIImage(named: "homeImage1-1.png")!,UIImage(named: "homeImage2.png")!, UIImage(named: "homeImage3.png")!, UIImage(named: "homeImage4")!, UIImage(named: "homeImage5")!, UIImage(named: "homeImage6")!]
        
        
        homeImage.animationDuration = 20
        homeImage.startAnimating()
        
       
        if menuButton != nil {
            
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
            
        }
        
        
        let navigation = self.navigationController?.navigationBar
        
        navigation?.barStyle = UIBarStyle.black
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.contentMode = .scaleAspectFit
        // 4
        let image = UIImage(named: "304MenuImg.png")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
        
        
        
        
        //Logo Sized for different screens
        let screenSizes: CGRect = UIScreen.main.bounds
        let screenWidth = screenSizes.width
        let screenHeight = screenSizes.height

        // for iPad
        if screenWidth == 768 && screenHeight == 1024 {
            
            homeImage.translatesAutoresizingMaskIntoConstraints = true
            homeImage.frame = CGRect(x: 0, y: 15, width: 768, height: 1025)
        }

        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.setToolbarHidden(true, animated: animated)
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        let navigation = self.navigationController?.navigationBar
        
        navigation?.barStyle = UIBarStyle.black
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.contentMode = .scaleAspectFit
        // 4
        let image = UIImage(named: "304MenuImg.png")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
