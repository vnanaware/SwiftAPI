//
//  ViewController.swift
//  APITestApp
//
//  Created by Admin on 21/09/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadLoginAPI()
    {
      
        let bodydata = NSMutableDictionary()
        /*bodydata.setObject((stremail), forKey: "email" as NSCopying)
        bodydata.setObject((strpass), forKey: "password" as NSCopying)
        bodydata.setObject((Constant.GlobalConstants.theAppDelegate.strDeviceToken), forKey: "device_id" as NSCopying)
        bodydata.setObject(("I"), forKey: "device_type" as NSCopying)*/
        
        //print("BODY DATA for User Registration : ",bodydata)
        
        let objc = WebApiController()
        objc.callAPI_POST("api/wslogin.php", andParams: bodydata as [NSObject : AnyObject], successCallback: #selector(self.response_user_login(apiAlias:response:)), andDelegate: self)
    }
    
    func response_user_login(apiAlias:NSString,response:NSData)
    {
        
        do
        {
            let ResponceData = try JSONSerialization.jsonObject(with: response as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableDictionary
            print("Response For response_user_login : \n ",ResponceData)
            
            let strsucess1=(ResponceData .value(forKey: "status") as! NSNumber)
            print(strsucess1)
            var strMSG1 = NSString()
            strMSG1=ResponceData .value(forKey: "message") as! NSString
            if strMSG1 == "sus"
            {
                
            }
        }
            catch
            {
                let alertMessage = UIAlertController(title: "Sorry!", message: "Invalid login details" as String, preferredStyle: .alert)
                alertMessage.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                self.present(alertMessage, animated: true, completion: nil)
            }
        }
}

