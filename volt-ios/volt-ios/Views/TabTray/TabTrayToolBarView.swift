//
//  TabTrayToolBarView.swift
//  volt-ios
//
//  Created by Matt Rockey on 12/16/23.
//

import SwiftUI

struct TabTrayToolBarView: View {
    
    @State var tabManager: TabManager
    
    var body: some View {
        
        HStack (spacing: 0) {
            
            Button(action: {
                print("Private Tab Action (Not Implemented)")
            }, label: {
                Text("Private")
            }).frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(hex: 0xc4c6d2))
            
            Button(action: {
                tabManager.newTab(title: "OpenAI", url: URL(string: "https://www.openai.com")!)
            }, label: {
                Image(systemName: "plus")
            }).frame(maxWidth: .infinity)
                .foregroundColor(Color(hex: 0xc4c6d2))
            
            Button(action: {
                print("Done Something Action (Not Implemented)")
            }, label: {
                Text("Done")
            }).frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(Color(hex: 0xc4c6d2))
            
        }
        
    }
}
