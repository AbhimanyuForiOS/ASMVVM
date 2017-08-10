import Foundation
import UIKit

public class KSMVVMTextField: ControlObserver,UITextFieldDelegate {
    private var control: UITextField!
    
    public init(propertyName:String, control: UITextField){
        super.init(propertyName: propertyName)
        self.control = control

        
        self.control.addTarget(self,
                               action: #selector(KSMVVMSwitch.switchValueChange),
                               for: UIControlEvents.editingChanged)
    }

    func switchValueChange(sender: UITextField) {
        delegate?.updateModel(propertyName: propertyName, value: sender.text as AnyObject?)
    }
    
    
    
    
    
    
    
    override public func updateControlValue(value: AnyObject?) {
            self.control.text  = value as? String ?? ""
    }
}
