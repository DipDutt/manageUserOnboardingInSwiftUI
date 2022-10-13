//
//  onBoardingView.swift
//  manageUserOnboarding
//
//  Created by dip dutt on 9/14/22.
//

import SwiftUI











struct onBoardingView: View {
    
    
    
    // onboardingState
    
    /*
     1.welcome screen
     2.add age
     3.add gender
     4.add name
     
     */
    
    @State var onboardingState:Int = 0
    @State var name:String = ""
    @State var age:Double = 50
    @State var gender:String =  ""
    let transition:AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    @State var aleartTittle:String = ""
    @State var showaleart: Bool = false
    
    
    // @appstorage
    
    
    
    @AppStorage("name") var currentuserName:String?
    @AppStorage("age") var currentAge:Int?
    @AppStorage("gender") var currentGender:String?
    @AppStorage("sign_In") var currentUserSignIn:Bool = false
    
    
    
    var body: some View {
        
        
        ZStack {
            
            
            // screen content
            
            
            
            ZStack {
                
                
                switch onboardingState {
                    
                case 0:
                    
                   welComeScreen
                        .transition(transition)
                    
                case 1 :
                    
                    addNameSection
                        .transition(transition)
                    
                case 2:
                    
                    
                ageSection
                        .transition(transition)
                    
                case 3:
                    
                    addGenderSection
                        .transition(transition)
                    
                default:
                    
                    RoundedRectangle(cornerRadius: 25.0)
                    
                        .foregroundColor(.green)
                    
                    
                }
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
            //buttons
            
            VStack {
                
                
                Spacer()
                
                
                buttonBody
                
           
                
                }
            .padding(30)
            
            
            
            
            
            
            
            
    }
        
        .alert(isPresented: $showaleart) {
            
            return Alert(title: Text(aleartTittle))
            
            
            
        }
        
        
        
        
    }
    
       
    
 }
    
    


struct onBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingView()
            .background(Color.purple)
    }
}
//MARK: components of screen contents

extension onBoardingView {
    
    
    
    
    private var buttonBody: some View {
        
        
        
        Text(onboardingState == 0 ? "SIGN UP" :onboardingState == 3 ? "FINISH": "NEXT")
                .font(.headline)
                .foregroundColor(.mint)
                .frame(height:55)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10.0)
            
                .onTapGesture {
                    
                    handleNextButtonPressed()
                    
                }
        
        
    
    }
    
    
    private  var welComeScreen: some View {
        
        
    
        
        
        
        VStack(spacing:40) {
            
            
            Spacer()
            
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(.white)
            
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay (
                    
                    Capsule(style: .continuous)
                    
                        .frame(height:3)
                        .offset(y:18)
                        .foregroundColor(.white)
                    
                    
                )
            
            Text("This is the num 1 matching app on online! in  this tutorial we are parcticing using appstorage and other swiftUI techniques")
                .foregroundColor(.white)
                .fontWeight(.semibold)
            
            Spacer()
            Spacer()
           
            
        }
        .multilineTextAlignment(.center)
        .padding(30)
        
        
        
        
        
        
        
        
        
        
        
        
    }// end of the welcme screen
    
    
    
    private var  addNameSection: some View {
        
        
        
        VStack(spacing:40) {
            
            
            Spacer()
            
            Text("what's your name?.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
          
            
            
            TextField("add your name", text: $name)
                .font(.headline)
                .frame(height:55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10.0)
                
            
            
            
            Spacer()
            Spacer()
           
            
        }
        .padding(30)
        
        
    }
    //end of the name screen
    
    
    
    private  var ageSection: some View {
        
        
        
        
        
        VStack(spacing:40) {
            
            
            Spacer()
            
            Text("what's your age?.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("\(String(format:"%.0f",age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
            
            Slider(value: $age, in: 18...100, step: 1)
            
            
           cornerRadius(10.0)
                
            
            
            
            Spacer()
            Spacer()
           
            
        }
        
        
        .padding(30)
        
        
        
        
        
    } // end of the age  section
    
    
    private var addGenderSection: some View {
        
        
        VStack(spacing:40) {
            
            
            Spacer()
            
            Text("what's your gender?.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Picker(selection: $gender,
                   label:Text(gender.count > 1 ? gender : "Select your gender")
                .font(.headline)
                .foregroundColor(.yellow)
                .frame(height: 55)
                .frame(maxWidth:.infinity)
                .background(.white)
                .cornerRadius(10.0)
                   
            ) {
                
                Text("Male").tag("MALE")
                Text("Female").tag("FEMALE")
                Text("non-binary").tag("NON-BINARY")
                
            }
            
            
            
            Spacer()
            Spacer()
           
            
        }
        
        
        .padding(30)
        
        
        
        
        
        
        
    }
    
}




// MARK:  FOR FUNCTIONS

extension onBoardingView {
    
    func handleNextButtonPressed() {
        
        // check inputs
        
        switch onboardingState {
            
        case 1 :
            
            guard name.count >= 3 else {
                
                
               showAlert(tittle: "add your name which includes al least 3 characters ")
                
                
                
                
                return
                
                
            }
            
            
            
        case 3 :
            
            guard gender.count > 1  else {
                
                
                
                showAlert(tittle: "please select your gender before move forward😵‍💫")
                
                
                return
                
                
                
                
                
            }
            
        default:
            
            break
                
                
                
            
            
            
            
            
        }
        
        // go to the next section
        
        if onboardingState == 3 {
            
            
            signIn()
            
            
        }
        
        
        else {
            
            
            withAnimation(.spring()) {
                
                
                onboardingState += 1
                
               
                
                
            }
            
            
            
        
        
        
        }
        
        
        
     
            
            
        }
        
    func showAlert(tittle:String) {
        
        aleartTittle = tittle
        
        showaleart.toggle()
        
        
        
        
    }
    
    
    func signIn() {
        
        
        currentuserName = name
        currentAge = Int(age)
        currentGender = gender
        withAnimation(.spring()) {
        currentUserSignIn = true
        
        
        }
        
        
    }
        
        

        
        
    
    }
    
    














