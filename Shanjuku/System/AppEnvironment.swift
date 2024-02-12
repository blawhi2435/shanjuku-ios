//
//  AppEnvironment.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/6.
//

import Foundation

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        
        let appState = AppState()
        
        let repositories = configuredRepositories()
        
        let interactors = configuredInteractors(appState: appState, repositories: repositories)
        
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        
        return .init(container: diContainer)
    }
    
    private static func configuredRepositories() -> DIContainer.Repositories {
        let groupRepository = GroupRepositoryImpl()
        let userRepository = UserRepositoryImpl()
        let activityRepository = ActivityRepositoryImpl()
        
        return .init(groupRepository: groupRepository, userRepository: userRepository, activityRepository: activityRepository)
    }
    
    private static func configuredInteractors(appState: AppState, repositories: DIContainer.Repositories) -> DIContainer.Interactors {
        
        let groupInteractor = GroupInteractorImpl(appState: appState, groupRepository: repositories.groupRepository)
        let userInteractor = UserInteractorImpl(appState: appState, userRepository: repositories.userRepository)
        let activityInteractor = ActivityInteractorImpl(appState: appState, activityRepository: repositories.activityRepository)
        
        return .init(groupInteractor: groupInteractor, userInteractor: userInteractor, activityInteractor: activityInteractor)
    }
}

