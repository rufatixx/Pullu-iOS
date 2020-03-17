//
//  SendEmailViewController.swift
//  pullu.test
//
//  Created by Javidan Mirza on 3/11/20.
//  Copyright © 2020 Rufat Asadzade. All rights reserved.
//

import UIKit

class SendEmailViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    var dbIns : DbInsert = DbInsert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
            
            
            //Looks for single or multiple taps.
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "Yüklənir...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        
        let userEmail = emailTextField.text
        dbIns.sendPassChangeMail(mail: userEmail!) {
            (status) in
                        
            switch status.response {
                
            case 0:
                self.dismiss(animated: false) {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "fourSegue", sender: self)
                }
                }
                break
            case 1:
                self.dismiss(animated: false){
                let alert = UIAlertController(title: "Bildiriş", message: " Server Error ", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil) }
                break
                
            case 2:
                self.dismiss(animated: false){
                let alert = UIAlertController(title: "Bildiriş", message: "Email mövcud deyil. Emailin düzgünlüyünü yoxlayın", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil) }
                
                break
            default: break
            }
        }
    }
    
    @IBAction func backToHomeButton(_ sender: Any) {
        self.dismiss(animated:true)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fourSegue") {
            let checkpass = segue.destination as! CheckPassViewController
            checkpass.usrEmail = emailTextField.text!
        }
    
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
