//
//  ContentView.swift
//  HookUp
//
//  Created by Daval Cato on 8/15/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView()
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
                .resizable()
                .frame(width: 200, height: 180)
                .padding(.horizontal)
                .padding(.vertical,60)
                .background(Color.white.opacity(0))
                .cornerRadius(30)
            
            Divider()
            
            Spacer(minLength: 0)
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
    }
}














