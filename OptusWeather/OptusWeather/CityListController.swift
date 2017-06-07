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
        setupViews()
        // ViewModel
        viewModel = CityListViewModel(delegate: self, apiClient: OpenWeatherMapApiClient())
        viewModel.handleLoadPressed() // Initiate load
    }

    // MARK: - Setup Views
    func setupViews() {
        let aux = attachAuxilliaryViews()
        loadingView = aux.loading
        errorView = aux.error
        errorView.addRetryHandler(self, action: #selector(retryPressed))
    }

    // MARK: - CityListViewModelDelegate
    func update(for state: CityListViewModelState) {
        print("State \(state)")
        switch state {
        case .initial:
            errorView.isHidden = true
            loadingView.isHidden = true
            tableView.reloadData()
            break
        case .loading:
            errorView.isHidden = true
            loadingView.isHidden = false
            loadingView.activityIndicator.startAnimating()
            break
        case .loaded:
            errorView.isHidden = true
            loadingView.isHidden = true
            tableView.reloadData()
            break
        case .error:
            loadingView.isHidden = true
            errorView.isHidden = false
            break
        }
    }

    // MARK: - Event Handlers
    func retryPressed() {
        print("Retry pressed")
        viewModel.handleLoadPressed()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel == nil {
            return 0
        }
        return viewModel.cities.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath)
        if let c = cell as? CityListCell {
            let city = viewModel.cities[indexPath.row]
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
