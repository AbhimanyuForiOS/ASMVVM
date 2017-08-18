
Model View - View Model Design Pattern




Please check Ex and you will understand about MVVM Machine .

you can update your model values by your UI Controls without intraction of ViewController  intraction.

At the Final Submit Button Of Any Form(ViewController) you will get dynamic updated  model which you gave to your UI Controls.

So Basically its Completly working on KVC AND POP Concept of Swift 3.0 which is direct synchronization of Model to View And View to Model updation.

It will incresase the development speed when you dont need to fill model manually on final submition of Form in your apps.

This is the Magic Module where you can get your Model values in UI And your UI Control updatation in your Model when things change in any case .
- if user will change property values From Model then changes will occure in UI which you binded with this model. 
- if user will change property values From UI Controls(Textfileds,stepper,slider etc) then changes will occure in Model(NSObject) class which you binded with this UI.

so at the final stage you will get a finall updated data for your long fields.


STEP 1 :-
- Drag Yellow box framework in downloaded project "MVVM.framework" in to your existing Project.
- Now go on Project->General->Embedded Bianies and hit "+" and add your  "MVVM.framework" here and clean your project.
- it will automatically reflect in   Project->General->Linked Frameworks and Libraries also.
- See in Viewcontroller class of Ex Project .
- where we wrote " import MVVM " at top.


STEP 2 :- Make A Model Class "Model.swift"

    
    import Foundation
    inport UIKit
    class Model : NSObject {
                var switchVal: Bool = false
                var firstName: String!
                var lastName: String!
                var valueSlider:Float = 0
                var valueStepper:Int = 12
                var valueTxtView:String!
                var dateOfBirth : NSDate!
                var vehicle: String!
 
   

                override init() {

                    switchVal = false
                    self.firstName = "Model"
                    self.lastName  = "Rathore"
                    self.valueSlider = 50
                    self.valueStepper = 2
                    self.valueTxtView =  "Vaishali Nagar, Jaipur"
                    dateOfBirth = NSDate()
                       vehicle = "Bike"

                }
    
                func toString() {

                    print("switchVal \(switchVal)")
                    print("firstName \(firstName)")
                    print("last name  \(lastName)")

                    print("valueSlider \(valueSlider)")
                    print("valueStepper \(valueStepper)")
                    print("valueTxtView\(valueTxtView)")
                    print("DOB: \(dateOfBirth)")
                     print("Picker Selected Row: \(vehicle)")

                }
              }//class closed


STEP 3 :- In your Viewcontroller class 
    import UIKit 
    import MVVM
    class ViewController: UIViewController,ObserverFactoryDelegate {
    
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
                    }//your controller class closed
    


That's it After this you dont need to taking care of your UI Control values on your final form " Submit Button"  of Viewcontroller.

![test](https://user-images.githubusercontent.com/7630897/29417202-fece52e8-8385-11e7-9149-d6a3c42c0c61.gif)


