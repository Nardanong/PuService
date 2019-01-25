//
//  ViewController.swift
//  PuService
//
//  Created by TST-APP-02 on 24/1/2562 BE.
//  Copyright © 2562 Nardanong.s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var user:String?
    var password:String?
    
    
    
    
    @IBOutlet weak var UserTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    } // Main Mothod
    
    func checkAuthen(user:String,password:String) -> Void {
        
        let myConstant = MyConstant()
        let urlPHP = myConstant.findJSONWhereUser(user: user)
        print("urlPHP ==> \(urlPHP)")
        
        guard let url = URL(string: urlPHP) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            (data,response,error) in
            
            guard let dataResponse = data,error == nil else  {
                print("Have Error")
                return
            }
            
//            Read Json From API
            do {
                let JSONResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print("JsonResponse ==> \(JSONResponse)")
                
//             change json to Array
                guard let jsonArray = JSONResponse as? [[String:Any]]else {
                    return
                }
                
                print("jsonArray ==> \(jsonArray)")
                
                guard let jsonDictionary:Dictionary = jsonArray[0]  else {
                    return
                }
                print("jsonDictionary ==> \(jsonDictionary)")
//                print("truePassword ==> \(jsonDictionary["Password"]!)")
                
                let truePassword:String = jsonDictionary["Password"]! as! String
                print("truePassword ==>\(truePassword)")
                
                if password == truePassword {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "GoService", sender: self)
                    }
                }else{
                    DispatchQueue.main.async {
                        self.myAlert(title: "Password false", message: "Please try again password")
                    }
                }
                
                
            }catch let myError {
                print(myError)
                print("No \(user) in database")
                
                DispatchQueue.main.async {
                    self.myAlert(title: "User False", message: "No \(user) in database")
                }
                
                
            }
            
        }//End Task
        task.resume()
    }
    
    
    func myAlert(title:String,message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        user = UserTextField.text
        password = PasswordTextField.text
        
        if (user?.count == 0) || (password?.count == 0) {
            print("Have Space")
            myAlert(title: "Have Space", message: "Please fill all Blank")
        }else{
            print("No Space")
            checkAuthen(user: user!, password: password!)
            
        }
    }
}//Main Class

