//
//  Model.swift
//  Firebase-SignUP-SignIN
//
//  Created by Nasrullah Khan on 25/01/2017.
//  Copyright © 2017 Nasrullah Khan. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

struct messageStruct{
    var mID: String
    var uID: String
    var timestamp: Double
    var message: String
}

class User:Mappable {
    
    var email: String?
    var name: String?
    var contactNo: String?
    var password: String?
    var uID: String?
    
    static var sharedUser: Variable<User?> = Variable<User?>(nil)
    static var allUsers: Variable<[String:User]> = Variable([:])
    
    init(email: String, name: String, contactNo: String, password: String) {
        self.email = email
        self.name = name
        self.contactNo = contactNo
        self.password = password
    }
    
    // Mappable
    func mapping(map: Map) {
        self.email           <- map["email"]
        self.name            <- map["name"]
        self.contactNo       <- map["contactNo"]
        self.password        <- map["password"]
    }
    
    required init(map: Map) {
        
    }

}

