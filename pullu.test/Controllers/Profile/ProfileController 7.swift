//
//  ProfileController.swift
//  pullu.test
//
//  Created by Rufat on 2/13/20.
//  Copyright © 2020 Rufat Asadzade. All rights reserved.
//

import UIKit

//Cavidan Mirzə

class ProfileController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var mobileNumField: UITextField!
    @IBOutlet weak var dogumTarixField: UITextField!
    @IBOutlet weak var cinsPicker: UIPickerView!
    @IBOutlet weak var ixtisasField: UIPickerView!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var creatDate: UITextField!
    
    
    var defaults = UserDefaults.standard
    var select:dbSelect=dbSelect()
    var profilM: [ProfileModel] = [ProfileModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let pass = defaults.string(forKey: "pass")
        let mail = defaults.string(forKey: "mail")
        select.getProfileInfo(mail: mail, pass: pass) {
            (list) in
//            DispatchQueue.main.async {
//                .   self.emailField.text =
//            }
            
        }
        
        
        
        // Do any additional setup after loading the view.
        
        // saveBtn.layer.insertSublayer(gradient, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .blue
        super.viewWillDisappear(animated)
        
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
