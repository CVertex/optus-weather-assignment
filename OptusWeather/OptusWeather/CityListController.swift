//
//  CityListController.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 26/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

struct Vm {
    let city:String
    let temp:String
}

func makeVms() -> [Vm] {
    return [
        Vm(city: "Sydney", temp: "23.9°"),
        Vm(city: "Brisbane", temp: "23.9°"),
        Vm(city: "Melbourne", temp: "45.2°")
    ]
}

class CityListController: UITableViewController {
    
    var vm:[Vm]! = nil
    var loadingView:LoadingView! = nil
    var errorView: ErrorView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        vm = makeVms()
        
        // Loading View
        self.loadingView = LoadingView.create()
        self.navigationController!.view.addSubview(self.loadingView)
        self.navigationController!.view.bringSubview(toFront: self.loadingView)
        
        // Loading View layout
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        let margins = self.navigationController!.view.layoutMarginsGuide
        
        self.loadingView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        self.loadingView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        
        self.loadingView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.loadingView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        self.loadingView.isHidden = true
        
        // Error View
        self.errorView = ErrorView.create()
        self.navigationController!.view.addSubview(self.errorView)
        self.navigationController!.view.bringSubview(toFront: self.errorView)
        // Error View layout
        self.errorView.translatesAutoresizingMaskIntoConstraints = false
        self.errorView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        self.errorView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        self.errorView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.errorView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath)
        
        if let c = cell as? CityListCell {
            let vm = self.vm[indexPath.row]
            c.cityLabel.text = vm.city
            c.temperatureLabel.text = vm.temp
        }

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
