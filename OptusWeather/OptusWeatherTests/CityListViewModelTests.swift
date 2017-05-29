//
//  CityListViewModelTests.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 26/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import XCTest
@testable import OptusWeather


/// Testing city list view model
class CityListViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Delegate Listener
    class Listener: NSObject, CityListViewModelDelegate {
        var state: CityListViewModelState? = nil
        func updateForState(state: CityListViewModelState) {
            self.state = state
        }
    }

    // MARK: Mock ApiClients
    class DoNothingClient: ApiClient {
        func fetchCitiesWeather(callback: @escaping CityWeatherCallback) {
        }
    }

    class CallbackClient: ApiClient {
        var callbackHandler: ((CityWeatherCallback) -> Void)? = nil
        func fetchCitiesWeather(callback: @escaping CityWeatherCallback) {
            DispatchQueue.main.async {
                self.callbackHandler?(callback)
            }
        }
    }

    class LoadCitiesClient: ApiClient {
        func fetchCitiesWeather(callback: @escaping CityWeatherCallback) {
            let cities = loadCitiesApiModel()
            DispatchQueue.main.async {
                callback(.success(cities))
            }
        }
    }

    class NetworkErrorClient: ApiClient {
        func fetchCitiesWeather(callback: @escaping CityWeatherCallback) {
            DispatchQueue.main.async {
                callback(.failure(.network))
            }
        }
    }

    // MARK: Tests
    func testInitialState() {
        // Arrange
        let listen = Listener()

        // Act
        let vm = CityListViewModel(delegate: listen, apiClient: DoNothingClient())

        // Assert
        // Loading and no cities
        XCTAssert(listen.state! == .initial)
        XCTAssert(vm.cities.count == 0)
    }

    func testInitialToLoading() {
        // Arrange
        let listen = Listener()
        let vm = CityListViewModel(delegate: listen, apiClient: DoNothingClient())

        // Act
        vm.handleLoadPressed()

        // Assert
        // Loading and no cities
        XCTAssert(listen.state! == .loading)
        XCTAssert(vm.state == .loading)
        XCTAssert(vm.cities.count == 0)
    }

    func testLoadingToLoaded() {
        // Arrange
        let listen = Listener()
        let client = CallbackClient()
        let vm = CityListViewModel(delegate: listen, apiClient: client)
        let expect = expectation(description: "Loaded expectation")
        client.callbackHandler = { callback in
            let cities = loadCitiesApiModel()
            callback(.success(cities))
            expect.fulfill()
        }

        // Act
        vm.handleLoadPressed() // Intial -> Loading -> Loaded

        // Assert
        // Loaded w/ 3 cities
        waitForExpectations(timeout: 10) { err in
            XCTAssert(listen.state! == .loaded)
            XCTAssert(vm.state == .loaded)
            XCTAssert(vm.cities.count == 3)
        }
    }

    func testLoadingToError() {
        // Arrange
        let listen = Listener()
        let client = CallbackClient()
        let vm = CityListViewModel(delegate: listen, apiClient: client)
        let expect = expectation(description: "Error expectation")
        client.callbackHandler = { callback in
            callback(.failure(.network))
            expect.fulfill()
        }

        // Act
        vm.handleLoadPressed() // Intial -> Loading -> Error

        // Assert
        // There's an error when loading
        waitForExpectations(timeout: 10) { err in
            XCTAssert(listen.state! == .error)
            XCTAssert(vm.state == .error)
            XCTAssert(vm.cities.count == 0)
        }
    }

    /// Testing a successful retry
    func testLoadingToErrorToLoadingToLoaded() {
        // Arrange, Loading -> Error
        let listen = Listener()
        let client = CallbackClient()
        let vm = CityListViewModel(delegate: listen, apiClient: client)
        var expect = expectation(description: "Error expectation")
        client.callbackHandler = { callback in
            callback(.failure(.network))
            expect.fulfill()
        }

        // Act
        vm.handleLoadPressed()

        // Assert
        waitForExpectations(timeout: 10) { err in
            XCTAssert(listen.state! == .error)
            XCTAssert(vm.state == .error)
            XCTAssert(vm.cities.count == 0)
        }

        // Arrange, Error -> Loading -> Loaded
        expect = expectation(description: "Loaded expectation")
        client.callbackHandler = { callback in
            callback(.success(loadCitiesApiModel()))
            expect.fulfill()
        }

        // Act
        vm.handleLoadPressed()

        // Assert
        // Loaded w/ 3 cities
        waitForExpectations(timeout: 5) { err in
            XCTAssert(listen.state! == .loaded)
            XCTAssert(vm.state == .loaded)
            XCTAssert(vm.cities.count == 3)
        }
    }
}
