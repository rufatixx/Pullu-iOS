//
//  ForgotLastPageViewController.swift
//  pullu.test
//
//  Created by Javidan Mirza on 3/13/20.
//  Copyright © 2020 Rufat Asadzade. All rights reserved.
//

import UIKit

class ForgotLastPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func finishButton(_ sender: Any) {
        DispatchQueue.main.async {
                 self.performSegue(withIdentifier: "getHomeSegue", sender: self)
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
