import Foundation

public class CLI {
    
    var configuration = Configuration()
    var view = View()
    
    public func welcome(){
        view.welcome()
    }
    
    public func description(){
        view.description()
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
            if(fieldName == ""){
                askForFields = false
                break
            }
            let fieldType = self.askForFieldType()
            if(fieldName == ""){
                askForFields = false
                break
            }
            configuration.userClassFields[fieldName] = fieldType
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
    
    public func askForAPIAddress(){
        view.askForAPIAddress()
        if let input = readLine() {
            configuration.APIAddress = input
        }
    }
    
    public func askForAPILoginRoute(){
        view.askForAPILoginRoute()
        if let input = readLine() {
            configuration.APILoginRoute = input
        }
    }
    
    public func askForAPISignUpRoute(){
        view.askForAPISignUpRoute()
        if let input = readLine() {
            configuration.APISignUpRoute = input
        }
    }
    
    public func askForAPIForgotPasswordRoute(){
        view.askForAPIForgotPasswordRoute()
        if let input = readLine() {
            configuration.APIForgotPasswordRoute = input
        }
    }
    
    
    public func end() {
        view.end(project: configuration.projectName)
    }
}
