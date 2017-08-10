//
//  Model.swift
//  Ex
//
//  Created by Abhimanyu  on 17/03/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit

class Model : NSObject {
    
    var switchVal: Bool = false
    var firstName: String!
    var lastName: String!
    var valueSlider:Float = 0
    var valueStepper:Int = 12
    var valueTxtView:String!
    var dateOfBirth : NSDate!
    var vehicle: String!
 
   

    override init() {
     
        switchVal = false
        self.firstName = "Model"
        self.lastName  = "Rathore"
        self.valueSlider = 50
        self.valueStepper = 2
        self.valueTxtView =  "Vaishali Nagar, Jaipur"
        dateOfBirth = NSDate()
           vehicle = "Bike"
    
    }
    
    func toString() {
        
        print("switchVal \(switchVal)")
        print("firstName \(firstName)")
        print("last name  \(lastName)")

        print("valueSlider \(valueSlider)")
        print("valueStepper \(valueStepper)")
        print("valueTxtView\(valueTxtView)")
        print("DOB: \(dateOfBirth)")
         print("Picker Selected Row: \(vehicle)")
        
    }
}
