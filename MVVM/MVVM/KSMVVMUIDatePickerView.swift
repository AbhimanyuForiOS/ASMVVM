
//

import Foundation
import UIKit

public class KSMVVMUIDatePickerView: ControlObserver {
    private var control: UIDatePicker!
    
    
    public init(propertyName:String, control: UIDatePicker){
        super.init(propertyName: propertyName)
        self.control = control
        self.control.addTarget(self,
                               action: #selector(KSMVVMUIDatePickerView.pickerValueChange),
                               for: UIControlEvents.valueChanged
        )
    }
    
    func pickerValueChange(sender: UIDatePicker) {
        delegate?.updateModel(propertyName: propertyName, value: sender.date as AnyObject?)
    }
    
    override public func updateControlValue(value: AnyObject?) {
        self.control.setDate(((value as? NSDate) ?? NSDate()) as Date, animated: true)
    }
}
