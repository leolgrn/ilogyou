//
//  View.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 15/01/2019.
//

import Foundation

public class View {
    
    public func welcome(){
        print("📱 Hi, welcome and thank you for using iLogYou ! 📱\n")
    }
    
    public func description(){
        print("... (TODO)")
    }
    
    public func askForProjectName(){
        print("Project name:")
    }
    
    public func askForUserModelFields(){
        print("Let's customize your User model !")
    }
    
    public func askForFieldName(){
        print("Field Name :")
    }
    
    public func askForFieldType(){
        print("Field Type : String, Int, Double, ...")
    }
    
    public func askForAPIAddress(){
        print("What's your complete API address ? ex: https://ilogyou.com/")
    }
    
    public func askForAPILoginRoute(){
        print("What's your login API route ? ex: user/login")
    }
    
    public func askForAPISignUpRoute(){
        print("What's your sign up API route ? ex: user/create")
    }
    
    public func askForAPIForgotPasswordRoute(){
        print("What's your forgotten password API route ? ex: user/password")
    }
    
    public func end(project: String){
        print("Le projet \(project) a bien été généré ! 🙈🙉")
    }
    
}
