//
//  ViewController.swift
//  BackDataPassingClosureTableView
//
//  Created by Mac on 07/11/1944 Saka.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var studentTableView: UITableView!
    var students : [Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.dataSource = self
        studentTableView.delegate = self
        
        let uinibName = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentTableView.register(uinibName, forCellReuseIdentifier: "StudentTableViewCell")
        // Do any additional setup after loading the view.
    }
    @IBAction func addInfo(_ sender: Any) {
        let svc = self.storyboard?.instantiateViewController(withIdentifier:"SecondViewController") as! SecondViewController
        
        svc.studentClosure = {
            (data) in
            self.students.append(data)
            self.studentTableView.reloadData()
            
        }
        self.navigationController?.pushViewController(svc, animated: true)
    }
    

}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
    
        let eachObject = students[indexPath.row]
        studentTableViewCell.firstNameLabel.text = eachObject.firstName
        studentTableViewCell.lastNameLabel.text = eachObject.lastName
        studentTableViewCell.phoneNumberLabel.text = String(eachObject.phoneNumber)
        studentTableViewCell.cityLabel.text = eachObject.city
        
        return studentTableViewCell ?? UITableViewCell()
    }
    
    
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156.0
    }
}
