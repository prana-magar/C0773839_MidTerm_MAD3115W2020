//
//  CustomerListViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
}

class CustomerListViewController: UIViewController {
    
   
  var resultSearchController = UISearchController()
    var filteredData: [Customer] = [Customer]()
   
    @IBOutlet weak var customerListTable: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // results searcher
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            customerListTable.tableHeaderView = controller.searchBar

            return controller
        })()
        
        self.customerListTable.reloadData()
        
        self.customerListTable.delegate = self
        self.customerListTable.dataSource = self
        self.navigationItem.title = "Customers"
//        self.customerListTable.backgroundColor = UIColor(red: 0, green: 0.749, blue: 0.882, alpha: 1.0)
        
    }
    
    @IBAction func logoutBtnDown(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.customerListTable.reloadData()
        
    }
    

    @IBAction func addBtnDown(_ sender: Any) {
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addCustomerView = storyBoard.instantiateViewController(identifier: "AddCustomerView")
        self.navigationController?.pushViewController(addCustomerView, animated: true)
        
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
            return self.filteredData.count
        }
        else{
            return ObjectManager.getInstance().getCustomerList().count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell") as! CustomTableCell
        
        var customers = [Customer]()
        if (resultSearchController.isActive) {
            customers = self.filteredData
            
        }
        else{
            customers = ObjectManager.getInstance().getCustomerList()
        }
        
        
        
//        cell?.textLabel?.text = customers[indexPath.row].name
        let customer = customers[indexPath.row]
        let imageName = customer.profileImageName ?? customer.placeholderImageName
        cell.profileImageView.image = UIImage(named: imageName)
        
        cell.profileImageView.frame.size.height = 50
        cell.profileImageView.frame.size.width = 50
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2
        cell.profileImageView.layer.borderWidth = 2.0
        
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = CGColor(srgbRed: 0, green: 0.749, blue: 0.7882, alpha: 1.0)
        cell.nameLabel.text = customers[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
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
        self.resultSearchController.isActive = false
    }
}

extension CustomerListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    
        var customers = ObjectManager.getInstance().getCustomerList()
        var filteredData = [Customer]()
        for customer in customers{
            if customer.name.lowercased().contains(searchController.searchBar.text!.lowercased()){
                filteredData.append(customer)
            }
        }
        self.filteredData = filteredData
        self.customerListTable.reloadData()
    }
    
  
    
}
