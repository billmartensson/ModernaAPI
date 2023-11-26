//
//  ContentView.swift
//  ModernaAPI
//
//  Created by BillU on 2023-11-26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var apistuff = ChuckAPI()
    
    var body: some View {
        VStack {
            Text(apistuff.joketext)
        }
        .padding()
        .onAppear() {
            Task {
                await apistuff.loadapi()
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}


/*
 
 do {
     var apitext = try String(contentsOf: url)
     
     print(apitext)
     
     joketext = apitext
 } catch {
     print("Det gick fel")
 }
 
 */
