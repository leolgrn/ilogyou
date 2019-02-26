import XCTest
import iLogYouCore

class TestAppDelegate: XCTestCase {
    
    func testValidAppDelegateFile() {
        let configuration = Configuration()
        let appDelegate = AppDelegate(configuration: configuration)
        XCTAssertTrue(appDelegate.content.contains("class AppDelegate"))
        XCTAssertTrue(appDelegate.content.contains("func application("))
        XCTAssertTrue(appDelegate.content.contains("func applicationWillResignActive"))
        XCTAssertTrue(appDelegate.content.contains("func applicationDidEnterBackground("))
        XCTAssertTrue(appDelegate.content.contains("func applicationWillEnterForeground("))
        XCTAssertTrue(appDelegate.content.contains("func applicationDidBecomeActive("))
        XCTAssertTrue(appDelegate.content.contains("func applicationWillTerminate("))
    }
    
    func testValidAppDelegatePath() {
        let configuration = Configuration()
        configuration.projectName = "iLogYouTest"
        let appDelegate = AppDelegate(configuration: configuration)
        XCTAssertTrue(appDelegate.path == "iLogYouTest/iLogYouTest/AppDelegate.swift")
    }
    
}

