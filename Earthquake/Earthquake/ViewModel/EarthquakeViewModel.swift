//
//  EarthquakeViewModel.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import NetworkCore

final class EarthquakeViewModel {
    var earthQuakes: Earthquake?
    var numberOfRows: Int {
        return earthQuakes?.features.count ?? 0
    }
    var error: NetworkError? = nil
    let dataManager: DataManager
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
    }
}

extension EarthquakeViewModel {
    func getdata(completion: @escaping () -> Void) {
        dataManager.loadData { result in
            switch result {
            case .success(let data):
                self.earthQuakes = data
            case .failure(let error):
                self.error = error
            }
            completion()
        }
    }
}
