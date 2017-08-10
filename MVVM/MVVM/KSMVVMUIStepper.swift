

import Foundation
import UIKit

public class KSMVVMUIStepper: ControlObserver {
    private var control: UIStepper!
    
    public init(propertyName:String, control: UIStepper){
        super.init(propertyName: propertyName)
        self.control = control
        
        self.control.addTarget(self,
                               action: #selector(KSMVVMUIStepper.stepValueChange),
                               for: UIControlEvents.valueChanged)
    }

    func stepValueChange(sender: UIStepper) {
        delegate?.updateModel(propertyName: propertyName, value: sender.value as AnyObject?)
    }
    
    override public func updateControlValue(value: AnyObject?) {
        self.control.value = Double((value as? NSNumber) ?? 0)
    }
}
