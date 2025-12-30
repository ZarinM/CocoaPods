//
//  WonderTableViewController.swift
//  worldWonders
//
//  Created by Зарина Муратова on 27.12.2025.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class WonderTableViewController: UITableViewController {
    var arrayWonders = [WorldWonder]()
    
    var isLoading = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
     //   arrayWonders.append(WorldWonder(name: "test", region: "test", location: "test"))
     //   tableView.reloadData()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        loadData()
    }
    
    @objc func handleRefresh() {
        if !isLoading {
            isLoading = true
            
            arrayWonders.removeAll()
            tableView.reloadData()
            
            loadData()
        }
    }
    
    func loadData() {
     //   http://demo0830167.mockable.io/getWonders
        SVProgressHUD.show()
        
        AF.request("http://demo0830167.mockable.io/getWonders", method: .get).responseData {
            response in
        
        SVProgressHUD.dismiss()
        self.isLoading = false
        self.refreshControl?.endRefreshing()
        
        if response.response?.statusCode == 200 {
            let json = JSON (response.data!)
            print(json)
            
            if let resultArray = json.array {
                for item in resultArray {
                    let wonderItem =  WorldWonder (json: item)
                    self.arrayWonders.append(wonderItem)
                }
                self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayWonders.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WonderTableViewCell

        // Configure the cell...
        cell.setData(wonder: arrayWonders[indexPath.row])

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
