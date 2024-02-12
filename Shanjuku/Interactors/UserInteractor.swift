//
//  UserInteractor.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/7.
//

import Foundation
import SwiftUI

protocol UserInteractor {
    func loadUserActivities(userID: String, activities: Binding<[Activity]>)
}

struct UserInteractorImpl: UserInteractor {
    
    private let appState: AppState
    private let userRepository: UserRepository
    
    init(appState: AppState, userRepository: UserRepository) {
        self.appState = appState
        self.userRepository = userRepository
    }
}

extension UserInteractorImpl {
    
    func loadUserActivities(userID: String, activities: Binding<[Activity]>) {
        
        var fetchActivities: [Activity]
        fetchActivities = userRepository.fetchUserActivities(userID: userID)
        activities.wrappedValue = fetchActivities
    }
}

struct StubUserInteractorImpl: UserInteractor {
    func loadUserActivities(userID: String, activities: Binding<[Activity]>) {}
}
