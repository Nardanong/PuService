//
//  MyConstant.swift
//  PuService
//
//  Created by TST-APP-02 on 25/1/2562 BE.
//  Copyright © 2562 Nardanong.s. All rights reserved.
//

import Foundation

class MyConstant  {
    
    func findURLaddUser(name:String,user:String,password:String) -> String {
        let result = "https://www.androidthai.in.th/hit/addUserPu.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(password)"
        return result
    }
    func findJSONWhereUser(user:String) -> String {
        let result = "https://www.androidthai.in.th/hit/getUserWhere1Pu.php?isAdd=true&User=\(user)"
        return result
        
    }
    
    
}//MyConstant Class


