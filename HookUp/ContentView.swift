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
            
            Spacer(minLength: 0)
            
            Image("logo")
                .resizable()
                .frame(width: 200, height: 180)
                .padding(.horizontal)
                .padding(.vertical,30)
                .background(Color.white.opacity(0))
                .cornerRadius(30)
            
            VStack(spacing: 4){
                
                HStack(spacing: 0){
                    
                    Text("Dating")
                        .font(.system(size: 35, weight: .heavy))
                        .foregroundColor(.white)
                    
                    Text("Match")
                        .font(.system(size: 35, weight: .heavy))
                        .foregroundColor(Color("txt"))
                    
                }
                
                Text("let's choose your match")
                    .foregroundColor(Color.black.opacity(0.3))
                    .fontWeight(.heavy)
                
            }
            .padding(.top)
            
            Divider()
            
            Spacer(minLength: 0)
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
    }
}














