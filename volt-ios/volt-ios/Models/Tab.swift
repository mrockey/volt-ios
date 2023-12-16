//
//  Tab.swift
//  volt-ios
//
//  Created by Matt Rockey on 12/16/23.
//

import Foundation
import WebKit

struct Tab: Identifiable, Hashable {

    var id = UUID()
    var title: String
    var url: URL

    init(title: String, url: URL) {
        self.title = title
        self.url = url
    }
    
    
}

