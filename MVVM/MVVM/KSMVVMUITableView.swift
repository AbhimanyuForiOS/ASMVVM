
import Foundation
import UIKit

public  class KSMVVMUITableView: ControlObserver, UITableViewDelegate, UITableViewDataSource{
    
    private var control: UITableView!
    public var pickerData: [String]!
    
    public  init(propertyName:String, control: UITableView, pickerData: [String]){
        super.init(propertyName: propertyName)
       
        self.control = control
        self.pickerData = pickerData;
        self.control.delegate = self
        self.control.dataSource = self
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pickerData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = pickerData[indexPath.row]
       return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
         delegate?.updateModel(propertyName: propertyName, value: (cell.textLabel?.text)! as String as AnyObject?)
    }
    
    
    

    override open func updateControlValue(value: AnyObject?) {
        
        //self.control.selectRow((value == nil ? 0 : pickerData.index(of: value as! String)!), inComponent: 0, animated: true)
    }
    
}
