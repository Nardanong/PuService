//
//  RegisterViewControler.swift
//  PuService
//
//  Created by TST-APP-02 on 24/1/2562 BE.
//  Copyright © 2562 Nardanong.s. All rights reserved.
//

import UIKit

class RegisterViewControler: UIViewController {
    
    //Explicit
    var name:String?
    var user:String?
    var pasword:String?
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var UserTextField: UITextField!
    
    @IBOutlet weak var passTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }//Main Method
    
    func uploadToServer(name:String,user:String,password:String) -> Void {
        
        let myConstant = MyConstant()
        let urlPHP:String = myConstant.findURLaddUser(name: name, user: user, password: password)
        print("URLPHP ==> \(urlPHP)")
        
    }
    
    
    func showAlert(title: String, message: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        self.present(objAlert, animated: true, completion: nil)
    }
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
//      Get value from textfield
        name = nameTextField.text
        user = UserTextField.text
        pasword = passTextFiled.text
        
//        show log
        print("name ==> \(String(describing: name))")
        print("user ==> \(String(describing: user))")
        print("pass ==> \(String(describing: pasword))")
        
//        Check state
        if (name!.count == 0) || (user!.count == 0) || (pasword!.count == 0) {
//        Have space
            print("Have Space")
            showAlert(title: "Have Space", message: "Please fill every blank")
        }else{
            print("No Space")
            uploadToServer(name: name!, user: user!, password: pasword!)
        }
        
    }//Upload Buuton
    
} //Main Class
