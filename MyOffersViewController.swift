//
//  MyOffersViewController.swift
//  304#
//
//  Created by Greg Fitzgibbon on 22/11/2015.
//  Copyright © 2015 Greg Fitzgibbon. All rights reserved.
//

import UIKit
import WebKit

class MyOffersViewController: UIViewController, WKNavigationDelegate, UIWebViewDelegate, UIScrollViewDelegate {
    
    var webView: WKWebView!
    
    let offersURL = "http://www.304clothing.com/codes"
    
    @IBOutlet weak var logoContainer: UIView!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    


    @IBOutlet weak var menuButton: UIBarButtonItem!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.spinner.layer.zPosition = 1;
        spinner.startAnimating()
        
        self.logo.layer.zPosition = 1
        self.logoContainer.layer.zPosition = 1
        
        
        logoContainer.isUserInteractionEnabled = true
        logo.isUserInteractionEnabled = true
        
        logo.alpha = 0


        // Do any additional setup after loading the view.
        
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
        
        loadWebURL(urlString: offersURL)
        
        self.webView.scrollView.bounces = false
        
        webView.scrollView.delegate = self
        
        //Logo Sized for different screens
        let screenSizes: CGRect = UIScreen.main.bounds
        let screenWidth = screenSizes.width
        let screenHeight = screenSizes.height
        
        // for iPad
        if screenWidth == 768 && screenHeight == 1024 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 768, height: 200)
            logo.translatesAutoresizingMaskIntoConstraints = true
            logo.frame = CGRect(x: 180, y: 20, width: 412, height: 93)
        }
        
        // for iPhone 6 Plus
        if screenWidth == 414 && screenHeight == 736 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 414, height: 200)
            logo.translatesAutoresizingMaskIntoConstraints = true
            logo.frame = CGRect(x: 0, y: 20, width: 412, height: 93)
        }
        
        // for iPhone 6
        if screenWidth == 375 && screenHeight == 667 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 375, height: 200)
            logo.translatesAutoresizingMaskIntoConstraints = true
            logo.frame = CGRect(x: -20, y: 20, width: 412, height: 93)
        }
        
        // for iPhone 5
        if screenWidth == 320 && screenHeight == 568 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logo.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 320, height: 200)
            logo.frame = CGRect(x: -40, y: 20, width: 412, height: 93)
            
        }
        
        // for iPhone 4
        if screenWidth == 320 && screenHeight == 480 {
            
            logoContainer.translatesAutoresizingMaskIntoConstraints = true
            logoContainer.frame = CGRect(x: 0, y: 0, width: 320, height: 190)
           logo.translatesAutoresizingMaskIntoConstraints = true
            logo.frame = CGRect(x: -40, y: 20, width: 412, height: 93)
        
        }
        
       
        
        view.bringSubviewToFront(logoContainer)
        view.bringSubviewToFront(logo)

        view.bringSubviewToFront(spinner)
        
    

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
        
//        if let url = NSURL(string: urlString) {
//            let urlRequest = NSURLRequest(url: url as URL)
//
//            webView.load(urlRequest as URLRequest)
//
//            spinner.startAnimating()
//        }
        
        
    }
    
    func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if (keyPath == "loading") {
            //backButton.enabled = webView.canGoBack
            //forwardButton.enabled = webView.canGoForward
        }
    }

    
    override func viewWillDisappear(_ animated: Bool)
    {
        webView.removeObserver(self, forKeyPath: "loading")
        //NSNotificationCenter.defaultCenter().removeObserver()
        webView.scrollView.delegate = nil
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: { () -> Void in self.logo.alpha = 1
            
            
        })
        
    }

    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
    }
    
    // gets called when the webview finishes loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        spinner.stopAnimating()
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
