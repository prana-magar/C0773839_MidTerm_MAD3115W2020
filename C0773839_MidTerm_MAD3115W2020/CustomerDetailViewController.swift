//
//  CustomerDetailViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomBillTableCell: UITableViewCell{
    
    @IBOutlet weak var labelBillId: UILabel!
    
    @IBOutlet weak var labelBillAmount: UILabel!
    @IBOutlet weak var labelBillDate: UILabel!
}


class CustomerDetailViewController: UIViewController {
    @IBOutlet weak var tblBills: UITableView!
    
    @IBOutlet weak var labelBillTotal: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var dobLabel: UILabel!
    
    var customer: Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblBills.dataSource = self
        self.tblBills.delegate = self

        if let customer = self.customer{
            self.nameLabel.text = customer.name
            self.emailLabel.text = customer.contact?.email
            self.phoneNumberLabel.text = customer.contact?.number
            self.dobLabel.text = customer.birthDate?.printFormat()
            let profileImageNameTxt = customer.profileImageName ?? customer.placeholderImageName
            self.profileImageView.image = UIImage(named:profileImageNameTxt )

        }
        
        
        
        self.profileImageView.frame.size.height = 100
        self.profileImageView.frame.size.width = 100
        self.profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        self.profileImageView.layer.borderWidth = 2.0
        
        self.labelBillTotal.text =  self.customer?.getTotalBill().priceFormat()
        
    }
    
    
    
    
    @IBAction func btnBillSave(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addBillView = storyBoard.instantiateViewController(identifier: "AddBillViewController") as! AddBillViewController
        addBillView.customer = self.customer
        self.navigationController?.pushViewController(addBillView, animated: true)
//        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tblBills.reloadData()
        self.labelBillTotal.text =  self.customer?.getTotalBill().priceFormat()
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


extension CustomerDetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.customer?.getBills().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomBillTableCell") as! CustomBillTableCell
        cell.labelBillId.text = self.customer?.getBills()[indexPath.row].id
        cell.labelBillDate.text = self.customer?.getBills()[indexPath.row].date.printFormat()
        cell.labelBillAmount.text = self.customer?.getBills()[indexPath.row].total.priceFormat()
        cell.layer.borderWidth = 3.0
        
        
        switch ObjectManager.getInstance().getBillType(bill: (self.customer?.getBills()[indexPath.row])!)  {
        case BillType.Hydro:
            cell.layer.borderColor = UIColor.red.withAlphaComponent(0.3).cgColor
        case BillType.Internet:
             cell.layer.borderColor = UIColor.blue.withAlphaComponent(0.3).cgColor
        default:
            cell.layer.borderColor = UIColor.green.withAlphaComponent(0.3).cgColor
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }
    
}
