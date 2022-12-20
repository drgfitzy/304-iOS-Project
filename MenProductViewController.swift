//
//  ViewController.swift
//  304#
//
//  Created by Greg Fitzgibbon on 26/10/2015.
//  Copyright © 2015 Greg Fitzgibbon. All rights reserved.
//

import UIKit
import WebKit

class MenProductViewController: UIViewController, WKNavigationDelegate, UIWebViewDelegate, UIScrollViewDelegate {
    
var webView: WKWebView!
    
    
    
    let mensClothingURL = "https://www.304clothing.com/collections/mens-all"
    
    
    @IBOutlet weak var logoContainer: UIView!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet var segmentSelect: UIView!
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        
        webView.goBack()
    
    }
   
    
    @IBAction func forwardPressed(sender: UIBarButtonItem) {
 
        webView.goForward()
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.bringSubviewToFront(spinner)
        
        
        self.spinner.layer.zPosition = 1;
        spinner.startAnimating()
        
        self.logo.layer.zPosition = 1
        self.logoContainer.layer.zPosition = 1
        
        
        logoContainer.isUserInteractionEnabled = true
        logo.isUserInteractionEnabled = true
        
        logo.alpha = 0
        
        
        
        
        if menuButton != nil {
            
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }

     
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
       let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        //Create and Instance of Webview
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        
       
        webView.navigationDelegate = self
             //webView = WKWebView(frame: view.bounds)
     
    
        
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
  
        

        
       view.addSubview(webView)
        
        //self.view = self.webView
        
        loadWebURL(urlString: mensClothingURL)
        
        self.webView.scrollView.bounces = false
        
        webView.scrollView.delegate = self
        
//Logo Sized for different screens
        let screenSizes: CGRect = UIScreen.main.bounds
        let screenWidth = screenSizes.width
        let screenHeight = screenSizes.height
        
        // for iPad
        if screenWidth == 768 && screenHeight == 1024 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 768, height: 150)
        }
        
        // for iPhone 6 Plus
        if screenWidth == 414 && screenHeight == 736 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 414, height: 148)
        }
        
        // for iPhone 6
        if screenWidth == 375 && screenHeight == 667 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 375, height: 148)
        }
        
        // for iPhone 5
        if screenWidth == 320 && screenHeight == 568 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 320, height: 148)
            
        }
        
        // for iPhone 4
        if screenWidth == 320 && screenHeight == 480 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 320, height: 148)
        }
        
        view.bringSubviewToFront(logoContainer)
        view.bringSubviewToFront(logo)
        
        
       
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        
     
        
        
 
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alert = UIAlertController(title: "No Internet Connection", message:"Make sure your device is connected to the internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
            self.present(alert, animated: true){}
            
            spinner.stopAnimating()

        }


 /*
        
        let upSwipe = UISwipeGestureRecognizer(target: webView, action: Selector("handleSwipes:"))
        let downSwipe = UISwipeGestureRecognizer(target: webView, action: Selector("handleSwipes:"))
        
        upSwipe.direction = .Up
        downSwipe.direction = .Down
        
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
*/

    }
    
  /*
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Up) {
            print("Swipe Up")
            let logoPosition = CGPointMake(self.logoContainer.frame.origin.x, self.logoContainer.frame.origin.y - 100.0);
            logoContainer.frame = CGRectMake( logoPosition.x , logoPosition.y , self.logoContainer.frame.size.width, self.logoContainer.frame.size.height)
        }
        
        if (sender.direction == .Down) {
            print("Swipe Down")
            let logoPosition = CGPointMake(self.logoContainer.frame.origin.x, self.logoContainer.frame.origin.y + 100.0);
            logoContainer.frame = CGRectMake( logoPosition.x , logoPosition.y , self.logoContainer.frame.size.width, self.logoContainer.frame.size.height)
        }
    }
    
   */
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        //Sized for different screens
        let screenSizes: CGRect = UIScreen.main.bounds
        let screenWidth = screenSizes.width
        let screenHeight = screenSizes.height
        
       //iPhone 6plus
        if screenWidth == 414 && screenHeight == 736 {
        
        //|| 375 || 320 {

    let percentScrolled = (scrollView.contentOffset.y/scrollView.contentSize.height)*100

    
    if percentScrolled > 4.5 {
        
        logoContainer.alpha = 0
        logo.alpha = 0
    }
    
else if percentScrolled < 4.5 {
        
        logoContainer.alpha = 1
            logo.alpha = 1
        
        
        }

        }
        
        //iPhone 6
        if screenWidth == 375 && screenHeight == 667 {
            
            //|| 375 || 320 {
            
            let percentScrolled = (scrollView.contentOffset.y/scrollView.contentSize.height)*100
            
            
            if percentScrolled > 4 {
                
                logoContainer.alpha = 0
                logo.alpha = 0
            }
                
            else if percentScrolled < 4 {
                
                logoContainer.alpha = 1
                logo.alpha = 1
      
        
        
            }
            
        }
        
       // iPhone 5
        if screenWidth == 320 && screenHeight == 568 {
            let percentScrolled = (scrollView.contentOffset.y/scrollView.contentSize.height)*100
            
            
            if percentScrolled > 4 {
                
                logoContainer.alpha = 0
                logo.alpha = 0
            }
                
            else if percentScrolled < 4 {
                
                logoContainer.alpha = 1
                logo.alpha = 1
                
                
                
            }

            
            
        }
        
        
        // iPhone 4S
        
        if screenWidth == 320 && screenHeight == 480 {
            
            //|| 375 || 320 {
            
            let percentScrolled = (scrollView.contentOffset.y/scrollView.contentSize.height)*100
            
            
            if percentScrolled > 4 {
                
                logoContainer.alpha = 0
                logo.alpha = 0
            }
                
            else if percentScrolled < 4 {
                
                logoContainer.alpha = 1
                logo.alpha = 1
                
                
                
            }
            
        }
        /*
        if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height {
            
            //logoContainer.alpha = 0
            //logo.alpha = 0
                print("BOTTOM REACHED")
        }
        if(scrollView.contentOffset.y <= 0.0){
            //logoContainer.alpha = 1
            //logo.alpha = 1
            print("TOP REACHED")
            */

}


    
    
    
    
    

    func loadWebURL(urlString: String){
        
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                print(contents)
            } catch
            {
                // contents could not be loaded
                print("bad contents")
            }
        } else {
            // the URL was bad!
            print("bad url")
        }
        
        
//        if let url = URL(string: urlString!) {
//            let urlRequest = URLRequest(url: url as URL)
//
//            webView.load(urlRequest as URLRequest)
//
//            spinner.startAnimating()
//}
 
        
    }
    
  
    
 
    func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutableRawPointer) {
        if (keyPath == "loading") {
            backButton.isEnabled = webView.canGoBack
            forwardButton.isEnabled = webView.canGoForward
        }
    }
    
    
/*
    func scrollViewDidScroll (scrollView: UIScrollView) {
        
        if scrollView == webView.scrollView {
        
            if  logoContainer.add
        
        }
    
    }
    
*/
    
    override func viewWillDisappear(_ animated: Bool)
    {
                    webView.removeObserver(self, forKeyPath: "loading")
            //NSNotificationCenter.defaultCenter().removeObserver()
        webView.scrollView.delegate = nil
        }
    



    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: { () -> Void in self.logo.alpha = 1
            
            
    })
    
    }
    
    

    
    // gets called when the webview starts loading
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
       
            }
    
    // gets called when the webview finishes loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    spinner.stopAnimating()
    }




}
