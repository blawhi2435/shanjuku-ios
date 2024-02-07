//
//  ShanjukuApp.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/5.
//

import SwiftUI

@main
struct ShanjukuApp: App {
    private let appEnvironment = AppEnvironment.bootstrap()
    var body: some Scene {
        WindowGroup {
            MainView()
                .inject(appEnvironment.container)
        }
    }
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white // 將背景色設置為不透明的顏色
        UITabBar.appearance().standardAppearance = appearance
    }
}
