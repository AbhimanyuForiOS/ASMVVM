

import Foundation
import UIKit

public class KSMVVMUITextView: ControlObserver, UITextViewDelegate{
    private var control: UITextView!
    
    public init(propertyName:String, control: UITextView){
        super.init(propertyName: propertyName)
        self.control = control
        self.control.delegate = self
    }
     public func textViewDidChange(_ textView: UITextView) {
        delegate?.updateModel(propertyName: propertyName, value: textView.text! as AnyObject?)
    }
    
    
    
    
    override public func updateControlValue(value: AnyObject?) {
        self.control.text = (value as? String?) ?? ""
    }
}
