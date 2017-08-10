//
//  Constraints.swift
//  Ex
//
//  Created by Abhimanyu  on 21/03/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit

public struct C{
    
    static func  set(item:AnyObject,attri:NSLayoutAttribute,relatedBy: NSLayoutRelation = .equal,toItem:AnyObject? = nil,attribute:NSLayoutAttribute = .notAnAttribute,multiplier:CGFloat = 1,constant:CGFloat = 0,viewMain:AnyObject){
        
        let any:NSLayoutConstraint = NSLayoutConstraint.init(item: item, attribute: attri, relatedBy: relatedBy, toItem: toItem, attribute: attribute, multiplier: multiplier, constant: constant)
        viewMain.addConstraint(any)
    }
}
