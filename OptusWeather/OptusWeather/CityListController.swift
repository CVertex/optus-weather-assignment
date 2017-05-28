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
    var viewModel: CityListViewModel! = nil
    // Views
    var loadingView: LoadingView! = nil
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
    func updateForState(state: CityListViewModelState) {
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

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath)
        if let c = cell as? CityListCell {
            let city = self.viewModel.cities[indexPath.row]
            c.cityLabel.text = city.name
            c.temperatureLabel.text = city.temperature
            c.backgroundColor = UIColor(hue: city.hue,
                                        saturation: 0.5,
                                        brightness: 1.0,
                                        alpha: 1.0)
        }

        return cell
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the CityVM to Details VC
        if let selectedCell = sender as? CityListCell,
           let indexPath = tableView.indexPath(for: selectedCell),
           let destination = segue.destination as? CityDetailsController {
            // Lookup the City VM
            let cityVm = viewModel.cities[indexPath.row]
            destination.city = cityVm
        }
    }
}
