
import Foundation
import UIKit

public  class KSMVVMUIPikerView: ControlObserver, UIPickerViewDelegate, UIPickerViewDataSource{

    private var control: UIPickerView!
    public var pickerData: [String]!

   public  init(propertyName:String, control: UIPickerView, pickerData: [String]){
        super.init(propertyName: propertyName)
        self.control = control
        self.pickerData = pickerData;
        self.control.delegate = self
        self.control.dataSource = self
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.updateModel(propertyName: propertyName, value: pickerData[row] as String as AnyObject?)
    }

    override open func updateControlValue(value: AnyObject?) {
        self.control.selectRow((value == nil ? 0 : pickerData.index(of: value as! String)!), inComponent: 0, animated: true)
    }
    
}
