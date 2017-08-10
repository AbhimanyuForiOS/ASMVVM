

import Foundation
import UIKit

public class KSMVVMUISlider: ControlObserver {
    private var control: UISlider!
    
    public init(propertyName:String, control: UISlider){
        super.init(propertyName: propertyName)
        self.control = control
        
        self.control.addTarget(self,
                               action: #selector(KSMVVMUISlider.sliderValueChange),
                               for: UIControlEvents.valueChanged)
    }
    
    
    func sliderValueChange(sender: UISlider) {
        delegate?.updateModel(propertyName: propertyName, value: sender.value as AnyObject?)
    }
    
    override public func updateControlValue(value: AnyObject?) {
        self.control.value = Float((value as? NSNumber) ?? 0)
    }
}
