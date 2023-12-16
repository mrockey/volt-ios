//
//  TabTrayView.swift
//  volt-ios
//
//  Created by Matt Rockey on 12/16/23.
//

import SwiftUI

struct TabTrayView: View {
    
    @ObservedObject private var tabManager = TabManager()
    @State var tabTraySearchBarQuery: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color(hex: 0x1e1e29).ignoresSafeArea()
            
            VStack (spacing: 0) {
                TabTraySearchBarView(tabTraySearchBarQuery: $tabTraySearchBarQuery)
                TabTrayContentView(tabManager: tabManager, tabTraySearchBarQuery: $tabTraySearchBarQuery)
            }.toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    TabTrayToolBarView(tabManager: tabManager)
                }
            }.onAppear() {
                UIToolbar.appearance().isTranslucent = false
                UIToolbar.appearance().barTintColor = UIColor(Color(hex: 0x1e1e29))
                if tabManager.tabs.isEmpty {
                    tabManager.newTab(title: "Google", url: URL(string: "https://www.google.com")!)
                }
            }
        }
    }
}

//struct WebView: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> WKWebView {
//        let webViewConfiguration = WKWebViewConfiguration()
//        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
//        let request = URL(string: "https://duckduckgo.com")!
//        webView.allowsBackForwardNavigationGestures = true
//        webView.load(URLRequest(url: request))
//        return webView
//
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//
//    }
//}

#Preview {
    TabTrayView()
}
