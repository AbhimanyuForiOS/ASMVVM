//
//  ViewController.swift
//  Ex
//
//  Created by Abhimanyu  on 17/03/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import UIKit
import MVVM
class ViewController: UIViewController,ObserverFactoryDelegate {
    
    //Model which you will get at final point with all updated values 
    lazy var model:Model! = Model()
    var machine: KSMVVMMachine!;
    
    //UI Objects
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var swtch: KSMVVMSwitch!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var txtView: UITextView!
    var datePicker:UIDatePicker!
    var pickerView:UIPickerView!
    let pickerData = ["Bike", "Luxury Bike", "Car", "Luxury Car"]
    @IBOutlet weak var btnSubmit: UIButton!

    //MARK:- Get final result
    @IBAction func btnGetActionTaped(_ sender: Any) {
        //you will get updated values by MVVM
        print(model.toString())
    }
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //register model which you want to update
        machine             = KSMVVMMachine(model: model)
        machine.delegate    = self
        
        //register ui objects and bind then with model properties
        machine.addObserver(propertyName: "switchVal", control: swtch)
        machine.addObserver(propertyName: "firstName", control: txtFName)
        machine.addObserver(propertyName: "lastName", control: txtLName)
        machine.addObserver(propertyName: "valueSlider", control: slider)
        machine.addObserver(propertyName: "valueStepper", control: stepper)
        machine.addObserver(propertyName: "valueTxtView", control: txtView)
        
        //make simple date picker for any device (iphone + ipad)
        datePicker                                           = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.backgroundColor                           = .red
        self.view.addSubview(datePicker)
        
        
        btnSubmit.layoutIfNeeded()
        

        //constratins programatically
        C.set(item: datePicker, attri: .bottom,     toItem: self.view, attribute: .bottom, viewMain: self.view)
        C.set(item: datePicker, attri: .leading,    toItem: self.view, attribute: .leading, viewMain: self.view)
        C.set(item: datePicker, attri: .width,      toItem: self.view, attribute: .width,multiplier: 0.65, viewMain: self.view)
        C.set(item: datePicker, attri: .top,        toItem: btnSubmit, attribute: .bottom,constant: 2, viewMain: self.view)
        
        
        //set this date picker in to observation MVVM machine
        machine.addObserver(propertyName: "dateOfBirth", control: datePicker);
        
        pickerView                  = UIPickerView()
        pickerView.backgroundColor  = UIColor.orange
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pickerView)

        datePicker.layoutIfNeeded()
        
        //constratins programatically
        C.set(item: pickerView, attri: .bottom,     toItem: self.view, attribute: .bottom, viewMain: self.view)
        C.set(item: pickerView, attri: .trailing,    toItem: self.view, attribute: .trailing, viewMain: self.view)
        C.set(item: pickerView, attri: .width,      toItem: self.view, attribute: .width,multiplier: 0.35, viewMain: self.view)
        C.set(item: pickerView, attri: .top,        toItem: btnSubmit, attribute: .bottom,constant: 2, viewMain: self.view)

        //picker view
        let pickerObserver = KSMVVMUIPikerView(propertyName: "vehicle", control: pickerView, pickerData: pickerData)
        machine.addObserver(control: pickerObserver)
    
        
    }
    func didFinishObservation(propertyName: String, value: AnyObject?) {
    
        if propertyName == "dateOfBirth" {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE, MMM yyyy, dd"
            //you will get updated values by MVVM
            print(model.toString())
        }else{
                print(value)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




