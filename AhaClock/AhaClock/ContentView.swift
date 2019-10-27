//
//  ContentView.swift
//  AhaClock
//
//  Created by KIM, Aha on 2019/10/20.
//  Copyright © 2019 KIM, Aha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }) { Text("yyyy-MM-dd'T'HH:mm:ss") }
            Button(action: {

            }) { Text("yyyy-MM-dd HH:mm:ss") }
            Button(action: {

            }) { Text("MM-dd HH:mm") }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
