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
        
        return .init(groupRepository: groupRepository, userRepository: userRepository)
    }
    
    private static func configuredInteractors(appState: AppState, repositories: DIContainer.Repositories) -> DIContainer.Interactors {
        
        let groupInteractor = GroupInteractorImpl(appState: appState, groupRepository: repositories.groupRepository)
        let userInteractor = UserInteractorImpl(appState: appState, userRepository: repositories.userRepository)
        
        return .init(groupInteractor: groupInteractor, userInteractor: userInteractor)
    }
}

