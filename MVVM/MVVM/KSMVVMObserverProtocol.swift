

import Foundation

// Delegate to update model after change value in controls
public protocol ObserverControlDelegate: class {
    func updateModel(propertyName:String, value: AnyObject?)
}
// Acknowladge after value changed in model or controls
public protocol ObserverFactoryDelegate: class {
        func didFinishObservation(propertyName:String, value: AnyObject?)
}
