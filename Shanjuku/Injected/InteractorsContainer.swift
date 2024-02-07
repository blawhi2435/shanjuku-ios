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
        
        init(groupInteractor: GroupInteractor, userInteractor: UserInteractor) {
            self.groupInteractor = groupInteractor
            self.userInteractor = userInteractor
        }
        
        static var stub: Self {
            .init(groupInteractor: StubGroupInteractorImpl(), userInteractor: stubUserInteractorImpl())
        }
    }
}

