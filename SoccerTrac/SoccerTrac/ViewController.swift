//
//  ViewController.swift
//  SoccerTrac
//
//  Created by Talenserv Mac on 11/29/16.
//  Copyright © 2016 Talenserv Mac. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController , FBSDKLoginButtonDelegate {
    @IBOutlet weak var faceBookLoginBn: FBSDKLoginButton!

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
//        view.addSubview(loginButton)
        
        if (FBSDKAccessToken.current()) != nil{
            fetchProfile()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchProfile () {
        
//        let parameters = ["filds": "email,first_name,last_name,picture.type(large)"]
        
        FBSDKGraphRequest.init(graphPath: "me", parameters:["fields": "email"]).start { (connection, result, error) in
            if error != nil
            {
                print(error!)
                return
            }
            let res : NSDictionary = result! as! NSDictionary
            print(res["email"]!)
        }
    
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        FBSDKAccessToken.setCurrent(nil)
        FBSDKProfile.setCurrent(nil)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("successfully login and result is :: \(result)")
        
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        
        return true
        
    }


}

