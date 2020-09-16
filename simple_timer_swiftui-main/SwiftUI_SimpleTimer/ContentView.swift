//
//  ContentView.swift
//  SwiftUI_SimpleTimer
//
//  Created by David Koenig on 18.06.19.
//  Copyright © 2019 David Koenig. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var nowDate: Date = Date()
    let referenceDate: Date
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.red).padding()
                Text("24 hours from Now:").foregroundColor(.white)
                    .font(.largeTitle)
                    .offset(x:0, y: -40)
                Text(countString(from: referenceDate)).foregroundColor(.white)
                    .font(.title)
                    .offset(x:0, y: 40)
                    .onAppear(perform: {
                        _ = self.timer
                    })
                }
            .navigationBarTitle(Text("Timer"))
            }
       
    }
    
    func countString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second], from: nowDate, to: referenceDate)
        return String(format: "%0dd:%0dh:%0dm:%0ds",
                    components.day ?? 00,
                    components.hour ?? 00,
                    components.minute ?? 00,
                    components.second ?? 00)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(referenceDate: Date(timeIntervalSinceNow: 86400))
    }
}
#endif
