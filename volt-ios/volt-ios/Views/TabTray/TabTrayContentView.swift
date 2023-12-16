//
//  TabTrayContentView.swift
//  volt-ios
//
//  Created by Matt Rockey on 12/16/23.
//

import SwiftUI

struct TabTrayContentView: View {
    
    @ObservedObject var tabManager: TabManager
    @Binding var tabTraySearchBarQuery: String
    
    private let minTabWidth = [GridItem(.adaptive(minimum: 170))]

    var body: some View {
        
        VStack (spacing: 0) {
            ScrollView (showsIndicators: false) {
                LazyVGrid (columns: minTabWidth, spacing: 15) {
                    ForEach(Array($tabManager.tabs.enumerated()).filter({ "\($1)".contains(tabTraySearchBarQuery) || tabTraySearchBarQuery.isEmpty }), id: \.element.id) { index, $tab in
                    
                        VStack (spacing: 0) {
                            
                            Text(tab.title)
                            
                            Button(action: {
                                tabManager.removeTab(at: index)
                            }, label: {
                                Text("X")
                            })
                            
                        }.frame(maxWidth: 170, minHeight: 170)
                            .background(.white)
                            .border(tabManager.selectedTab == tab ? Color.blue : Color.clear, width: 2)
                            .onTapGesture {
                                tabManager.selectedTab = tab
                                tabManager.focusedTab = tab
                            }
                    }
                }
            }
        }.padding(15)
    }
}
