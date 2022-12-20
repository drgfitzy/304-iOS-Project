//
//  SocialViewController.swift
//  304#
//
//  Created by Greg Fitzgibbon on 11/11/2015.
//  Copyright © 2015 Greg Fitzgibbon. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {
    
    
    var animator: UIDynamicAnimator!
    
    
   
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    @IBOutlet weak var twitterButton: UIButton!
    
    
    @IBOutlet weak var facebookButton: UIButton!
    
    
    @IBOutlet weak var instagramButton: UIButton!
    
    
    
    
    @IBAction func twitterPressed(sender: UIButton) {
        
        UIApplication.shared.openURL(NSURL (string: "https://twitter.com/304clothing")! as URL)
    }
    
    @IBAction func facebookPressed(sender: UIButton) {
        
        UIApplication.shared.openURL(NSURL (string: "https://www.facebook.com/304Clothing")! as URL)
        
    }
    
    
    @IBAction func instagramPressed(sender: UIButton) {
        
        UIApplication.shared.openURL(NSURL (string: "https://instagram.com/304clothing/")! as URL)
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        if menuButton != nil {
            
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    
        let screenSizes: CGRect = UIScreen.main.bounds
        let screenWidth = screenSizes.width
        let screenHeight = screenSizes.height
        
        // for iPad
        
        if screenWidth == 768 && screenHeight == 1024 {
            
            twitterButton.translatesAutoresizingMaskIntoConstraints = true
            facebookButton.translatesAutoresizingMaskIntoConstraints = true
            instagramButton.translatesAutoresizingMaskIntoConstraints = true
            titleImage.translatesAutoresizingMaskIntoConstraints = true
            
            twitterButton.frame = CGRect(x: 300, y: 250, width: 200, height: 200)
            facebookButton.frame = CGRect(x: 300, y: 472, width: 200, height: 200)
            instagramButton.frame = CGRect(x: 300, y: 700, width: 200, height: 200)
            titleImage.frame = CGRect(x: 170, y: 10, width: 480, height: 256)

            
        }

        
        
        
        
        
        
        
        // for iPhone 6 Plus
        
        if screenWidth == 414 && screenHeight == 736 {
            
            twitterButton.translatesAutoresizingMaskIntoConstraints = true
            facebookButton.translatesAutoresizingMaskIntoConstraints = true
            instagramButton.translatesAutoresizingMaskIntoConstraints = true
            titleImage.translatesAutoresizingMaskIntoConstraints = true
            
            twitterButton.frame = CGRect(x: 140, y: 160, width: 130, height: 130)
            facebookButton.frame = CGRect(x: 140, y: 310,width: 130,height: 130)
            instagramButton.frame = CGRect(x: 140, y: 460, width: 130, height: 130)
            titleImage.frame = CGRect(x: 100, y: 10, width: 240, height: 128)
            
        }
        
        
        // for iPhone 6
        if screenWidth == 375 && screenHeight == 667 {
            
            twitterButton.translatesAutoresizingMaskIntoConstraints = true
            facebookButton.translatesAutoresizingMaskIntoConstraints = true
            instagramButton.translatesAutoresizingMaskIntoConstraints = true
            titleImage.translatesAutoresizingMaskIntoConstraints = true
            
            twitterButton.frame = CGRect(x: 130, y: 160, width: 110, height: 110)
            facebookButton.frame = CGRect(x: 130, y: 290,width: 110,height: 110)
            instagramButton.frame = CGRect(x: 130, y: 420, width: 110, height: 110)
            titleImage.frame = CGRect(x: 70, y: 10, width: 240, height: 128)
   
            
        }

    
     // for iPhone 5
    if screenWidth == 320 && screenHeight == 568 {
    
    twitterButton.translatesAutoresizingMaskIntoConstraints = true
    facebookButton.translatesAutoresizingMaskIntoConstraints = true
    instagramButton.translatesAutoresizingMaskIntoConstraints = true
    titleImage.translatesAutoresizingMaskIntoConstraints = true
    
        twitterButton.frame = CGRect(x: 110, y: 140, width: 90, height: 90)
        facebookButton.frame = CGRect(x: 110, y: 260, width: 90, height: 90)
        instagramButton.frame = CGRect(x: 110, y: 380, width: 90, height: 90)
        titleImage.frame = CGRect(x: 70, y: 10, width: 180, height: 96)
       
        }
       
        
    // for iPhone 4
        
    if screenWidth == 320 && screenHeight == 480 {
            
            twitterButton.translatesAutoresizingMaskIntoConstraints = true
            facebookButton.translatesAutoresizingMaskIntoConstraints = true
            instagramButton.translatesAutoresizingMaskIntoConstraints = true
            titleImage.translatesAutoresizingMaskIntoConstraints = true
            
        twitterButton.frame = CGRect(x: 120, y: 120, width: 80, height: 80)
        facebookButton.frame = CGRect(x: 120, y: 210, width: 80, height: 80)
        instagramButton.frame = CGRect(x: 120, y: 300, width: 80, height: 80)
        titleImage.frame = CGRect(x: 80, y: 10, width: 180, height: 96)
  
            
        }

        
        
      
      /*
        
        // Init animator
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        
        // Add gravity
        
        let gravity = UIGravityBehavior(items:[twitterButton!, facebookButton!, instagramButton!])
        let direction = CGVectorMake(0.0, 1.0)
        gravity.gravityDirection = direction
        animator.addBehavior(gravity)
    
        //collison
        
        let boundries = UICollisionBehavior(items: [twitterButton!, facebookButton!, instagramButton!])
        boundries.translatesReferenceBoundsIntoBoundary = true
        
        animator.addBehavior(boundries)
        
        
        //bounce
        
        let bounce = UIDynamicItemBehavior(items: [twitterButton!, facebookButton!, instagramButton!])
        bounce.elasticity = 0.5
        
        animator.addBehavior(bounce)
        
        
        //attachment
       
        let twitterAnchorPoint = CGPointMake(150, 0)
        let facebookAnchorPoint = CGPointMake(70, 0)
        let instagramAnchorPoint = CGPointMake(150, 0)
        
        let twitterAttachment = UIAttachmentBehavior(item: twitterButton, attachedToAnchor: twitterAnchorPoint)
        
        let facebookAttachement = UIAttachmentBehavior(item: facebookButton, attachedToAnchor: facebookAnchorPoint)
        
        
        animator.addBehavior(twitterAttachment)
        animator.addBehavior(facebookAttachement)
*/
    
        
        twitterButton.alpha = 0
        facebookButton.alpha = 0
        instagramButton.alpha  = 0
        titleImage.alpha = 0.7
        
}


    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: { () -> Void in self.twitterButton.alpha = 0.6
            
        })
        
        UIView.animate(withDuration: 2.0, animations: { () -> Void in self.facebookButton.alpha = 0.75
        })
        
        UIView.animate(withDuration: 3.0, animations: { () -> Void in self.instagramButton.alpha = 0.9
        })
        
        
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
