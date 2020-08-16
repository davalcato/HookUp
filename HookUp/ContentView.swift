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
    
    @State var value : CGFloat = 0
    @StateObject var model = ModelData()
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
            
            VStack(spacing: 20) {
                
                CustomTextField(image: "person", placeHolder: "Email", txt: $model.email)
                
                CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password)
            }.offset(y: -self.value)
            .animation(.spring())
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                    
                    let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    let height = value.height
                    
                    self.value = height
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                    
                    self.value = 0
                }
            }
            .padding(.top)
            
            Spacer(minLength: 0)
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
    }
}

struct CustomTextField : View {
    
    var image : String
    var placeHolder : String
    @Binding var txt : String
    
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color("bottom"))
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            
            ZStack{
                
                if placeHolder == "Password"{
                    SecureField(placeHolder, text: $txt)
                }
                else{
                    TextField(placeHolder, text: $txt)
                }
            }
                .padding(.horizontal)
                .padding(.leading,65)
                .frame(height: 60)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
    
}

// MVVM Model will start here...

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""




}

























