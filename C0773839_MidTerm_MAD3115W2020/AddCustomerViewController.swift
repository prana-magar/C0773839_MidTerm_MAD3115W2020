//
//  AddCustomerViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-06.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtnDown(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func saveBtnDown(_ sender: Any) {
        
        // SAve
        
        self.dismiss(animated: true, completion: nil)
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
