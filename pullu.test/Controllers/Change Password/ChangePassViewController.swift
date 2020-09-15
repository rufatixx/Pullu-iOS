//
//  ChangePassViewController.swift
//  pullu.test
//
//  Created by Rufat on 5/25/20.
//  Copyright © 2020 Rufat Asadzade. All rights reserved.
//

import UIKit
import MBProgressHUD

class ChangePassViewController: UIViewController {
 var loadingAlert:MBProgressHUD?
   
    @IBOutlet weak var newPass: UITextField!
    @IBOutlet weak var repeatNewPass: UITextField!
    @IBOutlet weak var savePassButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.savePassButton.layer.cornerRadius = self.savePassButton.frame.height.self / 2.0
//        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
//            self.view.frame.origin.y = -200
//        }
//        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
//            self.view.frame.origin.y = 0.0
//        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
            view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard() {
          //Causes the view (or one of its embedded text fields) to resign the first responder status.
          view.endEditing(true)
      }
    
    @IBAction func changePassButton(_ sender: Any) {
        
        if  newPass.text != "" && repeatNewPass.text != ""{
            if newPass.text == repeatNewPass.text{
                loadingAlert = MBProgressHUD.showAdded(to: self.view, animated: true)
                loadingAlert!.mode = MBProgressHUDMode.indeterminate
               
                let defaults = UserDefaults.standard
             
                       
                let insert:DbInsert = DbInsert()
                insert.UPass(newPass:newPass.text! ){
                    
                    (status)
                    in
                    self.loadingAlert!.hide(animated: true)
                                  switch status.response{
                                  case 1:
                                   
                                      let alert = UIAlertController(title: "Uğurludur", message: "Sizin şifrəniz dəyişdirildi!", preferredStyle: UIAlertController.Style.alert)
                                      let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                                          UIAlertAction in
                                          // _ = self.tabBarController?.selectedIndex = 0
                                       _ = self.navigationController?.popToRootViewController(animated: true)
                                      }
                                      alert.addAction(okAction)
                                      self.present(alert, animated: true, completion: nil)
                                    case 2:
                                    let alert = UIAlertController(title: "Sessiyanız başa çatıb", message: "Zəhmət olmasa Yenidən daxil olun", preferredStyle: UIAlertController.Style.alert)
                                                                         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                                                         self.present(alert, animated: true, completion: nil)
                                  default:
                                      let alert = UIAlertController(title: "Xəta", message: "Zəhmət olmasa biraz sonra yenidən cəht edin.", preferredStyle: UIAlertController.Style.alert)
                                      alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                      self.present(alert, animated: true, completion: nil)
                                      
                                  }
                }
                              
                          }
            else  {
                let warningAlert = MBProgressHUD.showAdded(to: self.view, animated: true)
                            warningAlert.mode = MBProgressHUDMode.text
                //            warningAlert.isSquare=true
                            warningAlert.label.text = "Diqqət"
                            warningAlert.detailsLabel.text = "Yeni şifrə və yeni şifrənin təkrarı eyni deil"
                            warningAlert.hide(animated: true,afterDelay: 3)
                
                
            }
                
            }
       
        else
        {
             let warningAlert = MBProgressHUD.showAdded(to: self.view, animated: true)
                        warningAlert.mode = MBProgressHUDMode.text
            //            warningAlert.isSquare=true
                        warningAlert.label.text = "Diqqət"
                        warningAlert.detailsLabel.text = "Zəhmət olmasa bütün boşluqların doldurulmasından və media seçildiyindən əmin olun"
                        warningAlert.hide(animated: true,afterDelay: 3)
                        
        }
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
