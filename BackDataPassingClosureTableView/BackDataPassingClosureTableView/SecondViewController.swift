//
//  SecondViewController.swift
//  BackDataPassingClosureTableView
//
//  Created by Mac on 07/11/1944 Saka.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    var studentClosure : ((Student)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
    }
    @IBAction func gotoBack(_ sender: Any) {
        
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let phoneNumber = String(phoneNumberTextField.text!)
        let city = cityTextField.text!
        
        guard let studentClosuree = studentClosure else {
            return
        }
        let StudentObject = Student(firstName: firstName, lastName: lastName, phoneNumber: Int(phoneNumber)!, city: city)
        studentClosuree(StudentObject)
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
