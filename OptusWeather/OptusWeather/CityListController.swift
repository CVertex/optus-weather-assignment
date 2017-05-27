//
//  CityListController.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 26/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import UIKit

class CityListController: UITableViewController, CityListViewModelDelegate {
    
    // View Model
    var viewModel:CityListViewModel! = nil
    
    // Views
    var loadingView:LoadingView! = nil
    var errorView: ErrorView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup views
        self.setupViews()
        // ViewModel
        self.viewModel = CityListViewModel(delegate: self, apiClient: OpenWeatherMapApiClient())
        self.viewModel.handleLoadPressed() // Initiate load
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup Views
    func setupViews() {
        let margins = self.navigationController!.view.layoutMarginsGuide
        
        // Loading View
        self.loadingView = LoadingView.create()
        self.navigationController!.view.addSubview(self.loadingView)
        self.navigationController!.view.bringSubview(toFront: self.loadingView)
        // Fill and centre
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.loadingView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        self.loadingView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        self.loadingView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.loadingView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        // Error View
        self.errorView = ErrorView.create()
        self.navigationController!.view.addSubview(self.errorView)
        self.navigationController!.view.bringSubview(toFront: self.errorView)
        // Fill and centre
        self.errorView.translatesAutoresizingMaskIntoConstraints = false
        self.errorView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        self.errorView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        self.errorView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.errorView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        // Retry handler
        self.errorView.retryButton.addTarget(self,
                                             action: #selector(retryPressed),
                                             for: .touchUpInside)
        // Hide both by default
        self.errorView.isHidden = true
        self.loadingView.isHidden = true
    }
    
    // MARK: - CityListViewModelDelegate
    
    func updateForState(state:CityListViewModelState) {
        print("State \(state)")
        
        switch state {
        case .initial:
            self.errorView.isHidden = true
            self.loadingView.isHidden = true
            self.tableView.reloadData()
            break
        case .loading:
            self.errorView.isHidden = true
            self.loadingView.isHidden = false
            self.loadingView.activityIndicator.startAnimating()
            break
        case .loaded:
            self.errorView.isHidden = true
            self.loadingView.isHidden = true
            self.tableView.reloadData()
            break
        
        case .error:
            self.loadingView.isHidden = true
            self.errorView.isHidden = false
            break
        }
    }
    
    // MARK: - Event Handlers
    
    func retryPressed() {
        print("Retry pressed")
        self.viewModel.handleLoadPressed()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel == nil {
            return 0
        }
        return self.viewModel.cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath)
        
        if let c = cell as? CityListCell {
            let city = self.viewModel.cities[indexPath.row]
            c.cityLabel.text = city.name
            c.temperatureLabel.text = city.temperature
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
