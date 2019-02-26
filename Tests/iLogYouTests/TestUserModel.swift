import XCTest
import iLogYouCore

class TestUserModel: XCTestCase {
    
    func testBlankConfiguration() {
        let configuration = Configuration()
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.projectName, "")
        XCTAssertEqual(configuration.APIAddress, "")
        XCTAssertEqual(configuration.userClassFields, [:])
        XCTAssertEqual(configuration.APILoginRoute, "")
        XCTAssertEqual(configuration.APISignUpRoute, "")
        XCTAssertEqual(configuration.APIForgotPasswordRoute, "")
    }

    func testCreateUserModelWith3Fields() {
        let configuration = Configuration()
        configuration.userClassFields["username"] = "String"
        configuration.userClassFields["lastname"] = "String"
        configuration.userClassFields["age"] = "Int"
        
        let userModel = UserModel(configuration: configuration)
        
        XCTAssertTrue(userModel.content().contains("var username: String"))
        XCTAssertTrue(userModel.content().contains("var lastname: String"))
        XCTAssertTrue(userModel.content().contains("var age: Int"))
    }

    func testCreateUserModelWithNoFields() {
        let configuration = Configuration()
        
        let userModel = UserModel(configuration: configuration)
        
        XCTAssertTrue(userModel.content().contains("var email: String"))
        XCTAssertTrue(userModel.content().contains("var password: String"))
    }

}
