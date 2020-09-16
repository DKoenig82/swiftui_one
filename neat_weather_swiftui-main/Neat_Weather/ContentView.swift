//
//  ContentView.swift
//  Neat_Weather
//
//  Created by David Koenig on 26.01.20.
//  Copyright © 2020 David Koenig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }.font(.custom("Arial", size: 50)).colorInvert().padding(200).fixedSize()
            ZStack {
                RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.red)
                HStack {
                    Text("Degree").font(.custom("Arial", size: 30)).foregroundColor(Color.white).padding().offset(x: 0, y: -100).fixedSize()
                    Text("Humidity").font(.custom("Arial", size: 30)).offset(x: 0, y: -100).foregroundColor(Color.white).padding().fixedSize()
                }
                HStack {
                    Text("\(self.weatherVM.temperature) °C").font(.custom("Arial", size: 70)).foregroundColor(Color.white).padding().fixedSize()
                    Text("\(self.weatherVM.humidity) %").font(.custom("Arial", size: 70)).foregroundColor(Color.white).padding().fixedSize()
                }
                .padding(60)
                .multilineTextAlignment(.center)
            }
        
            
        }.frame(minWidth: 0, maxWidth: .infinity,  minHeight: 0, maxHeight: .infinity)
            .background(Color.primary)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
