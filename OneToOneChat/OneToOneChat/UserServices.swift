//
//  UserServices.swift
//  RealTimeParkingBookingSystem
//
//  Created by Nasrullah Khan on 28/01/2017.
//  Copyright © 2017 Nasrullah Khan. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import ObjectMapper


class UserServices {
    
    static func getAllUSers(comletion:@escaping (_ error:String?)->Void){
        
        cRef.child("users").observe(.childAdded, with: { (user) in
            let userObj = Mapper<User>().map(JSONObject: user.value!)
            userObj!.uID = user.key
            
            if User.sharedUser.value!.uID! != user.key {
                User.allUsers.value[user.key] = userObj!
            }
            comletion(nil)
            
        })
    }
    
}



