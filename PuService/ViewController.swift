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
        }
    }
}//Main Class

