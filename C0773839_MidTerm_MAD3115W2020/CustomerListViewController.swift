//
//  CustomerListViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController {
    @IBOutlet weak var customerListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customerListTable.delegate = self
        self.customerListTable.dataSource = self
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.customerListTable.reloadData()
        
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

extension CustomerListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ObjectManager.getInstance().getCustomerList().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
        
        let customers = ObjectManager.getInstance().getCustomerList()
        cell?.textLabel?.text = customers[indexPath.row].name
        cell?.detailTextLabel!.text = customers[indexPath.row].birthDate?.printFormat()
        return cell!
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customers = ObjectManager.getInstance().getCustomerList()
        let selectedCustomer = customers[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let customerDetailView = storyboard.instantiateViewController(identifier: "CustomerDetailView") as CustomerDetailViewController
        customerDetailView.customer = selectedCustomer
        self.navigationController?.pushViewController(customerDetailView, animated: true)
    }
}
