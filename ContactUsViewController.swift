//
//  ContactUsViewController.swift
//  304#
//
//  Created by Greg Fitzgibbon on 23/11/2015.
//  Copyright © 2015 Greg Fitzgibbon. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var emailButton: UIButton!
    
    
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var logo: UIImageView!
    
    
    @IBAction func emailPressed(sender: UIButton) {
      
        

        UIApplication.shared.openURL(NSURL (string: "mailto:hello@304clothing.com")! as URL)
        
    }
    
    
    @IBAction func phonePressed(sender: UIButton) {
        
        let url:NSURL = NSURL(string: "tel://+447921920378")!
        UIApplication.shared.openURL(url as URL)
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if menuButton != nil {
            
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
            
        }
        
        
        //Logo Sized for different screens
        let screenSizes: CGRect = UIScreen.main.bounds
        let screenWidth = screenSizes.width
        let screenHeight = screenSizes.height
        
        // for iPad
        if screenWidth == 768 && screenHeight == 1024 {
            
            emailButton.translatesAutoresizingMaskIntoConstraints = true
            phoneButton.translatesAutoresizingMaskIntoConstraints = true
            logo.translatesAutoresizingMaskIntoConstraints = true
            
            emailButton.frame = CGRect(x: 230, y: 130, width: 140, height: 140)
            phoneButton.frame = CGRect(x: 380, y: 130, width: 140, height: 140)
            logo.frame = CGRect(x: 250, y: 0, width: 264, height: 141)
        
        }
        
        // for iPhone 6 Plus
        if screenWidth == 414 && screenHeight == 736 {
            
            emailButton.translatesAutoresizingMaskIntoConstraints = true
            phoneButton.translatesAutoresizingMaskIntoConstraints = true
            logo.translatesAutoresizingMaskIntoConstraints = true
            
            emailButton.frame = CGRect(x: 60, y: 130, width: 140, height: 140)
            phoneButton.frame = CGRect(x: 220, y: 130, width: 140, height: 140)
            logo.frame = CGRect(x: 90, y: 0, width: 264, height: 141)
        
        }
        
        // for iPhone 6
        if screenWidth == 375 && screenHeight == 667 {
            
            emailButton.translatesAutoresizingMaskIntoConstraints = true
            phoneButton.translatesAutoresizingMaskIntoConstraints = true
            logo.translatesAutoresizingMaskIntoConstraints = true
            
            emailButton.frame = CGRect(x: 50, y: 130, width: 130, height: 130)
            phoneButton.frame = CGRect(x: 190, y: 130, width: 130, height: 130)
            logo.frame = CGRect(x: 70, y: 0, width: 240, height: 128)
        }
        
        // for iPhone 5
        if screenWidth == 320 && screenHeight == 568 {
            
            emailButton.translatesAutoresizingMaskIntoConstraints = true
            phoneButton.translatesAutoresizingMaskIntoConstraints = true
            logo.translatesAutoresizingMaskIntoConstraints = true
            
            emailButton.frame = CGRect(x: 35, y: 130, width: 110, height: 110)
            phoneButton.frame = CGRect(x: 170, y: 130, width: 110, height: 110)
            logo.frame = CGRect(x: 50, y: 0, width: 240, height: 128)
        }
        
        // for iPhone 4
        if screenWidth == 320 && screenHeight == 480 {
            
            emailButton.translatesAutoresizingMaskIntoConstraints = true
            phoneButton.translatesAutoresizingMaskIntoConstraints = true
            logo.translatesAutoresizingMaskIntoConstraints = true
            
            emailButton.frame = CGRect(x: 30, y: 110, width: 130, height: 130)
            phoneButton.frame = CGRect(x: 160, y: 110, width: 130, height: 130)
            logo.frame = CGRect(x: 60, y: 0, width: 216, height: 115)
        
        }


        // Do any additional setup after loading the view.
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
