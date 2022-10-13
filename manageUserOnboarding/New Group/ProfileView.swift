//
//  ProfileView.swift
//  manageUserOnboarding
//
//  Created by dip dutt on 9/17/22.
//

import SwiftUI

struct ProfileView: View {
    
    
    @AppStorage("name") var currentuserName:String?
    @AppStorage("age") var currentAge:Int?
    @AppStorage("gender") var currentGender:String?
    @AppStorage("sign_In") var currentUserSignIn:Bool = false
    
    var body: some View {
        
        
        VStack {
            
            
            
            Image(systemName: "person.circle.fill.")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text( currentuserName ?? "your name here")
            Text("the user is \(currentAge ?? 0) years old")
            Text("the user gender is \(currentGender ?? "unKnown")")
            
            
            Text("Sign Out ")
            
                .font(.headline)
                .foregroundColor(.blue)
                .frame(height:55)
                .frame(maxWidth:.infinity)
                .background(.white)
                .cornerRadius(10)
                
                
                .onTapGesture {
                    
                    singnOut()
                    
                    
                    
                }
                
                
                
            
            
            
            
            
        }
        
        .font(.title)
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical, 40)
        .cornerRadius(10)
        .shadow( radius: 10.0)
        
    
    }
    
    
    
    func singnOut() {
        
    currentuserName = nil
     currentAge = nil
     currentGender = nil
    currentUserSignIn = false
    
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
