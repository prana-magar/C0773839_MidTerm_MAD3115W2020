//
//  CustomerDetailViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {

   
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var dobLabel: UILabel!
    
    var customer: Customer?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let customer = self.customer{
            self.nameLabel.text = customer.name
            self.emailLabel.text = customer.contact?.email
            self.phoneNumberLabel.text = customer.contact?.number
            self.dobLabel.text = customer.birthDate?.printFormat()
            let profileImageNameTxt = customer.profileImageName ?? "headshot.jpg"
            self.profileImageView.image = UIImage(named:profileImageNameTxt )

        }
        
        
        
        self.profileImageView.frame.size.height = 150
        self.profileImageView.frame.size.width = 150
        self.profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        self.profileImageView.layer.borderWidth = 2.0
        
        
//        layoutSetup()
        
//        self.profilePicImageView.layer.masksToBounds = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func layoutSetup() {
    
        
    
        
        
//        let image: UIImage = UIImage(named: "hh.jpg")!
//        let profilePicImageViewObj = UIImageView(image: image )
//        self.profilePicImageView = profilePicImageViewObj
//        view.addSubview(profilePicImageView)
//        profilePicImageView.translatesAutoresizingMaskIntoConstraints = false
//        profilePicImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        profilePicImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
//
//        profilePicImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        profilePicImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//
//        self.profilePicImageView.frame.size.height = 150
//        self.profilePicImageView.frame.size.width = 150
//        profilePicImageView.layer.cornerRadius = profilePicImageView.frame.size.width / 2
        
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
