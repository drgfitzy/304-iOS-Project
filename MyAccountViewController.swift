//
//  MyAccountViewController.swift
//  304#
//
//  Created by Greg Fitzgibbon on 21/11/2015.
//  Copyright © 2015 Greg Fitzgibbon. All rights reserved.
//

import UIKit
import WebKit

class MyAccountViewController: UIViewController, WKNavigationDelegate, UIScrollViewDelegate {
    
    
var webView: WKWebView!
    

let myAccountURL = "https://www.304clothing.com/customer/account/login/"
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var logoContainer: UIView!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    @IBAction func backPressed(sender: AnyObject) {
        
        
        webView.goBack()
    }
    
 
    @IBAction func forwardPressed(sender: AnyObject) {
        
        
        webView.goForward()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.startAnimating()
        self.spinner.layer.zPosition = 1
        
        
        self.logo.layer.zPosition = 1
        self.logoContainer.layer.zPosition = 1
        
        logoContainer.isUserInteractionEnabled = true
        logo.isUserInteractionEnabled = true
        
        logo.alpha = 0
        
        
        
        if menuButton != nil {
            
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        // Do any additional setup after loading the view.
    }
        
       
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        //Create and Instance of Webview
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        webView.navigationDelegate = self
        
        webView.scrollView.delegate = self
        
        webView.addObserver(self, forKeyPath: "loading", options: [], context: nil)
        //webView = WKWebView(frame: view.bounds)
        
        view.addSubview(webView)
        
        //self.view = self.webView
        
        loadWebURL(urlString: myAccountURL)
        
        
        
        
        self.webView.scrollView.bounces = false
        
        
        
        
        
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
            logoContainer.frame = CGRect(x: 0, y: 0, width: 414, height: 150)
        }
        
        // for iPhone 6
        if screenWidth == 375 && screenHeight == 667 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 375, height: 150)
        }
        
        // for iPhone 5
        if screenWidth == 320 && screenHeight == 568 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 320, height: 150)
            
        }
        
        // for iPhone 4
        if screenWidth == 320 && screenHeight == 480 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 320, height: 150)
            

        }

        view.bringSubviewToFront(logo)
        view.bringSubviewToFront(logoContainer)
        
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        
       
       /*
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "adjustForKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "adjustForKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
        */
        
        
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alert = UIAlertController(title: "No Internet Connection", message:"Make sure your device is connected to the internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
            self.present(alert, animated: true){}
            
            spinner.stopAnimating()
            
        }
        

    }
    
    /////////////////////////
   /*
    func adjustForKeyboard(notification: NSNotification) {
        
        
        if notification.name == UIKeyboardWillShowNotification {
            logoContainer.removeFromSuperview()
            }
        
        else if notification.name == UIKeyboardWillHideNotification {
            view.addSubview(logoContainer)
        }

    
    }

*/
    
    //////////////////////////////////////
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        //Sized for different screens
        let screenSizes: CGRect = UIScreen.main.bounds
        let screenWidth = screenSizes.width
        
        if screenWidth == 414 {
            
            //|| 375 || 320 {
            
            let percentScrolled = (scrollView.contentOffset.y/scrollView.contentSize.height)*100
            
            
            if percentScrolled > 12 {
                
                logoContainer.alpha = 0
                logo.alpha = 0
            }
                
            else if percentScrolled < 12 {
                
                logoContainer.alpha = 1
                logo.alpha = 1
                
                
            }
            
        }
        
        if screenWidth == 375 {
            
            //|| 375 || 320 {
            
            let percentScrolled = (scrollView.contentOffset.y/scrollView.contentSize.height)*100
            
            
            if percentScrolled > 12 {
                
                logoContainer.alpha = 0
                logo.alpha = 0
            }
                
            else if percentScrolled < 12 {
                
                logoContainer.alpha = 1
                logo.alpha = 1
                
                
                
            }
            
        }
        if screenWidth == 320 {
            
            //|| 375 || 320 {
            
            let percentScrolled = (scrollView.contentOffset.y/scrollView.contentSize.height)*100
            
            
            if percentScrolled > 12 {
                
                logoContainer.alpha = 0
                logo.alpha = 0
            }
                
            else if percentScrolled < 12 {
                
                logoContainer.alpha = 1
                logo.alpha = 1
                
                
                
            }
            
        }

        
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
        
        
//        if let url = URL(string: urlString) {
//            let urlRequest = URLRequest(url: url as URL)
//
//            webView.load(urlRequest as URLRequest)
//
//            }
        }
    
    
    
    func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if (keyPath == "loading"){
        
            backButton.isEnabled = webView.canGoBack
            forwardButton.isEnabled = webView.canGoForward
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        webView.removeObserver(self, forKeyPath: "loading")
        
        webView.scrollView.delegate = nil
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
    }
    
    // gets called when the webview finishes loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        spinner.stopAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: { () -> Void in self.logo.alpha = 1
            
            //self.backButton.enabled = false
            //self.forwardButton.enabled = false
            
            //self.backButton.enabled = self.webView.canGoBack
            //self.forwardButton.enabled = self.webView.canGoForward
            
        })
        
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
