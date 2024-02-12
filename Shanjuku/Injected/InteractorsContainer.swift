//
//  InteractorsContainer.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/6.
//

import Foundation

extension DIContainer {
    struct Interactors {
        let groupInteractor: GroupInteractor
        let userInteractor: UserInteractor
        let activityInteractor: ActivityInteractor
        
        init(groupInteractor: GroupInteractor, userInteractor: UserInteractor, activityInteractor: ActivityInteractor) {
            self.groupInteractor = groupInteractor
            self.userInteractor = userInteractor
            self.activityInteractor = activityInteractor
        }
        
        static var stub: Self {
            .init(groupInteractor: StubGroupInteractorImpl(), userInteractor: StubUserInteractorImpl(), activityInteractor: StubActivityInteractorImpl())
        }
    }
}

