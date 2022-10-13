//
//  ContentView.swift
//  manageUserOnboarding
//
//  Created by dip dutt on 9/14/22.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("sign_In") var currentUserSignIn:Bool = false
    
    var body: some View {
        
        ZStack {
            
            
            RadialGradient(colors: [Color.white, Color.purple], center: .topLeading, startRadius: 5, endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            
            
            if currentUserSignIn {
                
                
                ProfileView()
            }
            
            else {
                
                
                onBoardingView()
            }
            
            
        }





    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
