//
//  ContentView.swift
//  HookUp
//
//  Created by Daval Cato on 8/15/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct LoginView : View {
    
    var body: some View{
        
        VStack{
            
            Image("logo")
                .padding(.horizontal)
                .padding(.vertical,20)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            Divider()
            
            Spacer(minLength: 0)
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
    }
}














