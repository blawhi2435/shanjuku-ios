//
//  ActivityInteractor.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/10.
//

import Foundation
import SwiftUI

protocol ActivityInteractor {
    func loadSchedules(activityID: String, schedules: Binding<[Schedule]>)
}

struct ActivityInteractorImpl: ActivityInteractor {
    
    private let appState: AppState
    private let activityRepository: ActivityRepository
    
    init(appState: AppState, activityRepository: ActivityRepository) {
        self.appState = appState
        self.activityRepository = activityRepository
    }
    
    
}

extension ActivityInteractorImpl {
    func loadSchedules(activityID: String, schedules: Binding<[Schedule]>) {
        
        var fetchSchedules: [Schedule]
        fetchSchedules = activityRepository.fetchSchedules(by: activityID)
        schedules.wrappedValue = fetchSchedules
    }
}

struct StubActivityInteractorImpl: ActivityInteractor {
    func loadSchedules(activityID: String, schedules: Binding<[Schedule]>) {}
}
