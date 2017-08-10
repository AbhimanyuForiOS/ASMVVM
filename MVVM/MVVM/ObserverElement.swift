
import Foundation
import UIKit

class ObserverElement {
    var id: Int!;
    var propertyName: String!
    var control: ControlObserver!;
    
    
    init(id: Int!, propertyName: String!, control: ControlObserver!) {
        self.id = id;
        self.propertyName   = propertyName;
        self.control        = control;
    }
    
    
}
