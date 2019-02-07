//
//  CLI.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 15/01/2019.
//

import Foundation

public class CLI {
    
    var configuration = Configuration()
    var view = View()
    
    public func welcome(){
        view.welcome()
    }
    
    public func askForProjectName(){
        view.askForProjectName()
        if let input = readLine(){
            configuration.projectName = input
        }
    }
    
    public func askForUserModelFields(){
        view.askForUserModelFields()
        var askForFields = true
        while(askForFields){
            let fieldName = self.askForFieldName()
            let fieldType = self.askForFieldType()
            configuration.userClassFields[fieldName] = fieldType
            askForFields = self.keepGoing()
        }
    }
    
    public func askForFieldName() -> String {
        view.askForFieldName()
        if let input = readLine() {
            return input
        } else {
            return ""
        }
    }
    
    public func askForFieldType() -> String {
        view.askForFieldType()
        if let input = readLine() {
            return input
        } else {
            return ""
        }
    }
    
    public func keepGoing() -> Bool {
        view.askToKeepGoing()
        if let input = readLine() {
            if(input == "No"){
                return false
            }
        }
        return true
    }
    
    public func askForAPIAddress(){
        view.askForAPIAddress()
        if let input = readLine() {
            configuration.APIAddress = input
        }
    }
    
    
    public func end() {
        print("Le projet \(configuration.projectName) a bien été généré ! 🙈🙉")
    }
}
