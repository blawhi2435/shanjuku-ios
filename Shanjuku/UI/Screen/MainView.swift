//
//  ContentView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/5.
//

import SwiftUI

enum Tab: Int, CaseIterable, Identifiable {
    case groups
    case activity
    case account
    
    var id: Int {
        self.rawValue
    }
    
    var name: String {
        switch self {
        case .groups: return "Groups"
        case .activity: return "Activity"
        case .account: return "Account"
        }
    }
    
    var icon: String {
        switch self {
        case .groups: return "person.2"
        case .activity: return "bolt.horizontal.circle"
        case .account: return "person.crop.circle"
        }
    }
    
    var activeColor: Color {
        switch self {
        case .groups: return Color.darkGreen
        case .activity: return Color.darkGreen
        case .account: return Color.darkGreen
        }
    }
}

struct MainView: View {
    @State private var selectedTab: Tab = .groups
    var tabItems = Tab.allCases
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            ForEach(tabItems) { tabItem in
                switch tabItem {
                case .groups:
                    GroupView()
                        .tabItem {
                            Label(tabItem.name, systemImage: tabItem.icon)
                        }
                        .tag(tabItem)
                    
                case .activity:
                    ActivityListView()
                        .tabItem {
                            Label(tabItem.name, systemImage: tabItem.icon)
                        }
                        .tag(tabItem)
                    
                case .account:
                    Text(tabItem.name)
                        .tabItem {
                            Label(tabItem.name, systemImage: tabItem.icon)
                        }
                        .tag(tabItem)
                }
            }
        }
        .tint(.darkGreen)
    }
}

#Preview {
    MainView()
        .inject(AppEnvironment.bootstrap().container)
}
