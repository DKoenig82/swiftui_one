//
//  ContentView.swift
//  News_App_SwiftUI
//
//  Created by David Koenig on 23.04.20.
//  Copyright © 2020 David Koenig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newsVM: NewsViewModel
    
    init() {
        self.newsVM = NewsViewModel()
    }
    
    var body: some View {
        VStack {
            ForEach(, id: \.title) { news in
                Text(news)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
