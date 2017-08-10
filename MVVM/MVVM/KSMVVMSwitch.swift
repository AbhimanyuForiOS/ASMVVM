import Foundation
import UIKit

public class KSMVVMSwitch: ControlObserver {
    private var control: UISwitch!
    
    public init(propertyName:String, control: UISwitch){
        super.init(propertyName: propertyName)
        self.control = control
        
        self.control.addTarget(self,
                               action: #selector(KSMVVMSwitch.switchValueChange),
                               for: UIControlEvents.valueChanged)
    }
    
    
    func switchValueChange(sender: UISwitch) {
        delegate?.updateModel(propertyName: propertyName, value: sender.isOn as AnyObject?)
    }
    
    override public func updateControlValue(value: AnyObject?) {
        self.control.setOn((value as? Bool ?? false), animated: true)
    }
}
