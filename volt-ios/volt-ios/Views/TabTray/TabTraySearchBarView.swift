//
//  TabTraySearchBarView.swift
//  volt-ios
//
//  Created by Matt Rockey on 12/16/23.
//

import SwiftUI
import Combine
import WebKit

struct TabTraySearchBarView: View {

    @Binding var tabTraySearchBarQuery: String
    @FocusState var tabTraySearchBarFocused: Bool

    var body: some View {

        HStack (spacing: 0) {

            Image(systemName: "magnifyingglass")
                .frame(maxWidth: 40, maxHeight: 40)
                .foregroundColor(Color(hex: 0xa2a2ae))
                .background(RoundedCorners(color: Color(hex: 0x35353e), tl: 10, tr: 0, bl: 10, br: 0))
                .cornerRadius(0)

            TextField("", text: $tabTraySearchBarQuery, prompt: Text("Search tabs").foregroundColor(Color(hex: 0xa2a2ae)))
                .frame(maxWidth: .infinity, maxHeight: 40)
                .foregroundColor(Color(hex: 0xb6b9c5))
                .background(RoundedCorners(color: Color(hex: 0x35353e), tl: 0, tr: 0, bl: 0, br: 0))
                .focused($tabTraySearchBarFocused)

            HStack (spacing: 0) {
                if tabTraySearchBarFocused && tabTraySearchBarQuery != "" {
                    Button(action: {
                        tabTraySearchBarQuery = ""
                    }, label: {
                        Image(systemName: "multiply.circle")
                    })
                }
            }.frame(maxWidth: 40, maxHeight: 40)
                .foregroundColor(Color(hex: 0xa2a2ae))
                .background(RoundedCorners(color: Color(hex: 0x35353e), tl: 0, tr: 10, bl: 0, br: 10))
                .cornerRadius(0)

        }.frame(maxWidth: .infinity, maxHeight: 55)
            .padding(.horizontal, 12)
            .autocorrectionDisabled()
            .keyboardType(.webSearch)
            .textInputAutocapitalization(.never)

    }
}
