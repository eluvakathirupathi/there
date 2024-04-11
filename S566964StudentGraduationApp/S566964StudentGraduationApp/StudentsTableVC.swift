//
//  StudentsTableVC.swift
//  S566964StudentGraduationApp
//
//  Created by Thirupathi Eluvaka on 4/4/24.
//

import UIKit

class StudentsTableVC: UITableViewController {

    
    @IBOutlet var tableViev: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViev.delegate=self
        tableViev.dataSource=self
        /*
        Answer the following questions using string literals and print statements in the StudentsTableVC’s viewDidLoad method.
        1.    What is a Root View Controller in a Navigation Controller?
        2.    What data structure is used by a Navigation Controller to manage its view controllers?
        3.    What is a navigation item in a view controller
         */
        
        print("\n1. Rootview Controller is the first view controller in navigationcontroller  \n2. Stack is used in navigation controller to manage its views \n3. Navigation items are the items or controls which are availble for view controllers embeded in navigation controller to perform certain actions basically going back to previous screen. navigation items can be placed in navigation are either to top right or left or middle.")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return DataManager.sharedDataManager.fetchStudents().keys.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "undergard"
        default:
            return "Graduate"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.sharedDataManager.fetchStudents()[Array(DataManager.sharedDataManager.fetchStudents().keys)[section]]?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

                guard let items = DataManager.sharedDataManager.fetchStudents()[Array(DataManager.sharedDataManager.fetchStudents().keys)[indexPath.section]] else{
            return cell
        }
        let Student = items[indexPath.row]
        var config = cell.defaultContentConfiguration()
        
        config.image=UIImage(systemName: "person.crop.square")
        
        var name = Student.firstName+","+Student.lastName
        config.text = name
        config.secondaryText = "Credit hours earned"+String(Student.creditHoursEarned)
        cell.contentConfiguration = config
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail",sender: self)
        var name = indexPath.row
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        dest.title = "Hello,"
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
