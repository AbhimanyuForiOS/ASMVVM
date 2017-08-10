
import Foundation
import UIKit

var obj:KSMVVMMachine!
public class KSMVVMMachine:ObserverControlDelegate{
    
     var model: NSObject!
     private lazy var observers = [ObserverElement]();
    
    public  var delegate:ObserverFactoryDelegate?
    
    
   //MARK:- Single tone object of MVVM Machine
   public init (model: NSObject) {
         self.model = model;
    }
    
    public func addObserver(propertyName: String, control: AnyObject) {
        
        var controlObserver: ControlObserver!;
        if control is UISwitch {
            controlObserver = KSMVVMSwitch(propertyName: propertyName,
                                               control: control as! UISwitch)
        }
        else if control is UITextField{
            controlObserver = KSMVVMTextField(propertyName: propertyName,
                                           control: control as! UITextField)
        }
        else if control is UIStepper{
            controlObserver = KSMVVMUIStepper(propertyName: propertyName,
                                              control: control as! UIStepper)
        }
        else if control is UITextView{
            controlObserver = KSMVVMUITextView(propertyName: propertyName,
                                              control: control as! UITextView)
        }
        else if control is UISlider{
            controlObserver = KSMVVMUISlider(propertyName: propertyName,
                                              control: control as! UISlider)
        }
        else if control is UIDatePicker {
            controlObserver = KSMVVMUIDatePickerView(propertyName: propertyName,
                                                   control: control as! UIDatePicker)
        }
        
        controlObserver.delegate = self;
        controlObserver.updateControlValue(value: self.model.value(forKey: propertyName) as AnyObject?)
        
        let element = ObserverElement(id: observers.count + 1,
                                      propertyName: propertyName,
                                      control: controlObserver);
        
        observers.append(element);
    }
    public func updateValue(propertyName: String, value: AnyObject?) {
        
    
        model.setValue(value, forKey: propertyName);
        
        observers.filter({ (element) -> Bool in
            return element.propertyName == propertyName as String
        }).forEach { (element) in
            element.control.updateControlValue(value: value )
    
        }
    
        if delegate != nil {
            delegate?.didFinishObservation(propertyName: propertyName, value: value)
        }
        
    }
    
    
    public func addObserver(control: ControlObserver) {
        
        let element = ObserverElement(id: observers.count + 1,
                                      propertyName: control.propertyName,
                                      control: control)
        element.control.delegate = self;
        element.control.updateControlValue(value: self.model.value(forKey: control.propertyName) as AnyObject?)
        observers.append(element);
    }
    
    
    public func updateModel(propertyName: String, value: AnyObject?) {
        self.updateValue(propertyName: propertyName, value: value!);
    }

}

