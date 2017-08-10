
import Foundation

open class ControlObserver: NSObject {
    
    public var propertyName: String!;
    
    public weak var delegate:ObserverControlDelegate?
    
    open func updateControlValue(value: AnyObject?) { }
    
    public init(propertyName: String) {
        self.propertyName = propertyName;
    }
    
}
