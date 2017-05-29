//
//  CityListViewModel.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 25/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// View states for the city list
public enum CityListViewModelState {
    case initial
    case loading
    case loaded
    case error
}

public protocol CityListViewModelDelegate : class {
    func updateForState(state: CityListViewModelState)
}

public class CityListViewModel {
    /// Dependencies
    let modelManager: CityWeatherModelManager
    /// Delegate
    weak var delegate: CityListViewModelDelegate?
    /// State
    public var cities: [CityViewModel] = [CityViewModel]()
    var state: CityListViewModelState = .initial {
        didSet {
            DispatchQueue.main.async {
                // Notify state change
                self.delegate?.updateForState(state: self.state)
            }
        }
    }

    /// Init
    public init(delegate: CityListViewModelDelegate, apiClient: ApiClient) {
        self.delegate = delegate
        self.modelManager = CityWeatherModelManager(apiClient: apiClient)
        self.cities = []
        self.state = .initial
        // Manually notify delegate
        self.delegate?.updateForState(state: .initial)
    }

    // MARK: Public actions
    public func handleLoadPressed() {
        if self.state == .loading {
            return // Already loading
        }

        self.state = .loading // Loading
        self.modelManager.loadCities { result in
            switch result {
            case .failure:
                self.state = .error
                break
            case let .success(cities):
                self.cities = cities.map(CityViewModel.init)
                self.state = .loaded
                break
            }
        }
    }
}
