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
                
                Text("the best way to choose your match")
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
            
            // Here is the Login button
            Button(action: {}) {
                
                Text("LOGIN")
                    .fontWeight(.bold)
                    .foregroundColor(Color("bottom"))
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(Color.white)
                    .clipShape(Capsule())
            }
            .padding(.top,22)
            
            HStack(spacing: 12){
                
                Text("Don't have an account?")
                    .foregroundColor(Color.white.opacity(0.7))
                
                Button(action: {model.isSignUp.toggle()}) {
                    
                    Text("Sign Up Now")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.top,25)
            
            Button(action: {}) {
                
                Text("Forgot password?")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.vertical,22)
     
            Spacer(minLength: 0)
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
        
        .fullScreenCover(isPresented: $model.isSignUp) {
            
            SignUpView(model: model)
            
            
            
        }
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
                
                if placeHolder == "Password" || placeHolder == "Re-Enter"{
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

struct SignUpView : View {
    
    @State var value : CGFloat = 0
    @ObservedObject var model : ModelData
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
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
                        
                        Text("New")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("Profile")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("txt"))
                        
                    }
                    
                    Text("Create a profile here!!!")
                        .foregroundColor(Color.black.opacity(0.3))
                        .fontWeight(.heavy)
                    
                }
                .padding(.top)
                
                VStack(spacing: 20) {
                    
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email_SignUP)
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password_SignUp)
                    
                    CustomTextField(image: "lock", placeHolder: "Re-Enter", txt: $model.reEnterPassword)
                    
                    
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
                
                Button(action: {}) {
                    
                    Text("SIGNUP")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bottom"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
                .padding(.vertical,22)
                
                Spacer(minLength: 0)
                
            }
            
            Button(action: {model.isSignUp.toggle()}) {
                
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            .padding(.top,10)
            
        })
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
    }
}

// MVVM Model will start here...

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUP = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var resetEmail = ""
    

    
    // Here is where the AlertView with TextFields goes...
    
    func resetPassword(){
        
        let alert = UIAlertController(title: "Reset Password", message: "Enter your E-Mail ID To Reset Your Password", preferredStyle: .alert)
        
        alert.addTextField { (password) in
            password.placeholder = "Email"
        }
        let proceed = UIAlertAction(title: "Reset", style: .default) { (_) in
            
            self.resetEmail = alert.textFields![0].text!
        }
    }
}

























