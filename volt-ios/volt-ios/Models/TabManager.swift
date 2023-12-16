//
//  TabManager.swift
//  volt-ios
//
//  Created by Matt Rockey on 12/16/23.
//

import Foundation

class TabManager: ObservableObject {

    @Published var tabs: [Tab] = []
    @Published var focusedTab: Tab? = nil // Tab that is full screened
    @Published var selectedTab: Tab? = nil // Tab that was last selected

    func newTab(title: String, url: URL) {
        let tab = Tab(title: title, url: url)
        tabs.append(tab)
        selectedTab = tab
    }

    func removeTab(at index: Int) {
        tabs.remove(at: index)
    }

}
