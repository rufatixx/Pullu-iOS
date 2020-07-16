//
//  CheckPassViewController.swift
//  pullu.test
//
//  Created by Javidan Mirza on 3/11/20.
//  Copyright © 2020 Rufat Asadzade. All rights reserved.
//

import UIKit
import MBProgressHUD
class CheckOtp: UIViewController, UITextFieldDelegate {
 var loadingAlert:MBProgressHUD?
    @IBOutlet weak var pass1text: UITextField!
    @IBOutlet weak var pass2text: UITextField!
    @IBOutlet weak var pass3text: UITextField!
    @IBOutlet weak var pass4text: UITextField!
    var select : dbSelect = dbSelect()
    var login: String = ""
    var verifyNumber: String = ""
    var phoneNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)

        pass1text.delegate = self
        pass2text.delegate = self
        pass3text.delegate = self
        pass4text.delegate = self
    }
    
    @objc func dismissKeyboard() {
           //Causes the view (or one of its embedded text fields) to resign the first responder status.
           view.endEditing(true)
       }
    
    @IBAction func closeButtonClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if !(string == "") {
                textField.text = string
                if textField == pass1text {
                    pass2text.becomeFirstResponder()
                }
                else if textField == pass2text {
                    pass3text.becomeFirstResponder()
                }
                else if textField == pass3text {
                    pass4text.becomeFirstResponder()
                }
                else if textField == pass4text{
                    loadingAlert = MBProgressHUD.showAdded(to: self.view, animated: true)
                                  loadingAlert!.mode = MBProgressHUDMode.indeterminate
                             
                           
                           
                            verifyNumber = "\(pass1text.text!)\(pass2text.text!)\(pass3text.text!)\(pass4text.text!)"
                           
                           print(verifyNumber)
                    select.verifyOtp(mobile: phoneNum, otp: Int(verifyNumber)!) {
                               (Status) in
                               
                              self.loadingAlert!.hide(animated: true)
                               
                               switch Status.response {
                                   
                               case 1:
                                   DispatchQueue.main.async {
                                       self.performSegue(withIdentifier: "passCreatorSegue", sender: self)
                                   }
                                   break
                                   
                        
                                   
                                   case 2:
                                   let alert = UIAlertController(title: "Bildiriş", message: "Kod yalnışdır!", preferredStyle: UIAlertController.Style.alert)
                                   alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
                                   self.present(alert, animated: true, completion: nil)
                                   
                                   break
                                case 3:
                                                            let alert = UIAlertController(title: "Oops", message: "Hall hazırda serverlərimizdə problem yaşanır və biz artıq bunun üzərində çalışırıq", preferredStyle: UIAlertController.Style.alert)
                                                                                                       alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                                                                                       alert.addAction(UIAlertAction(title: "Ətraflı", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
                                                                                                           let alert = UIAlertController(title: "Ətraflı", message: "Lütfən bu mesajı screenshot edib developerə göndərəsiniz\n xəta kodu: \(Status.response!)\n\(Status.responseString ?? "")", preferredStyle: UIAlertController.Style.alert)
                                                                                                           alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                                                                                           self.present(alert, animated: true, completion: nil)
                                                                                                       }))
                                                                                                       self.present(alert, animated: true, completion: nil)
                                                            break
                                case 4:
                                                                 let alert = UIAlertController(title: "Xəta", message: "Biraz sonra yenidən cəht edin", preferredStyle: UIAlertController.Style.alert)
                                                                 alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
                                                                 self.present(alert, animated: true, completion: nil)
                                
                               default : break
                               }
                           }
                }
                else {
                    textField.resignFirstResponder()
                }
                return false
            }
            return true
        }

        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            if (textField.text?.count ?? 0) > 0 {

            }
            return true
        }
    

    @IBAction func nextButton(_ sender: Any) {
        
//        let alert = UIAlertController(title: nil, message: "Yüklənir...", preferredStyle: .alert)
//
//        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//        loadingIndicator.hidesWhenStopped = true
//        loadingIndicator.style = UIActivityIndicatorView.Style.gray
//        loadingIndicator.startAnimating();
//
//
//        alert.view.addSubview(loadingIndicator)
//        present(alert, animated: true, completion: nil)
       
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if(segue.identifier == "passCreatorSegue"){
                         let displayVC = segue.destination as! PassCreatorController
                         displayVC.phoneNum = phoneNum
            displayVC.otp = Int(verifyNumber)!
                     }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    

}
