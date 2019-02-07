//
//  BasicFiles.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 16/01/2019.
//

import Foundation

public class BasicFiles {
    
    public static var appDelegate = """
    import UIKit
    
    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {
        
        var window: UIWindow?
        
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = LoginViewController()
            window?.makeKeyAndVisible()
            
            return true
        }
        
        func applicationWillResignActive(_ application: UIApplication) {
            // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
            // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        }
        
        func applicationDidEnterBackground(_ application: UIApplication) {
            // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
            // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        }
        
        func applicationWillEnterForeground(_ application: UIApplication) {
            // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        }
        
        func applicationDidBecomeActive(_ application: UIApplication) {
            // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        }
        
        func applicationWillTerminate(_ application: UIApplication) {
            // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        }
        
        
    }
    """
    
    public static var info = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>CFBundleDevelopmentRegion</key>
        <string>$(DEVELOPMENT_LANGUAGE)</string>
        <key>CFBundleExecutable</key>
        <string>$(EXECUTABLE_NAME)</string>
        <key>CFBundleIdentifier</key>
        <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
        <key>CFBundleInfoDictionaryVersion</key>
        <string>6.0</string>
        <key>CFBundleName</key>
        <string>$(PRODUCT_NAME)</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleShortVersionString</key>
        <string>1.0</string>
        <key>CFBundleVersion</key>
        <string>1</string>
        <key>LSRequiresIPhoneOS</key>
        <true/>
        <key>UILaunchStoryboardName</key>
        <string>LaunchScreen</string>
        <key>UIRequiredDeviceCapabilities</key>
        <array>
            <string>armv7</string>
        </array>
        <key>UISupportedInterfaceOrientations</key>
        <array>
            <string>UIInterfaceOrientationPortrait</string>
            <string>UIInterfaceOrientationLandscapeLeft</string>
            <string>UIInterfaceOrientationLandscapeRight</string>
        </array>
        <key>UISupportedInterfaceOrientations~ipad</key>
        <array>
            <string>UIInterfaceOrientationPortrait</string>
            <string>UIInterfaceOrientationPortraitUpsideDown</string>
            <string>UIInterfaceOrientationLandscapeLeft</string>
            <string>UIInterfaceOrientationLandscapeRight</string>
        </array>
    </dict>
    </plist>
    """
    
    public static var lauchscreenPart1 = """
    <?xml version="1.0" encoding="UTF-8"?>
    <document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="14460.31" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" launchScreen="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES" initialViewController="01J-lp-oVM">
    <device id="retina4_7" orientation="portrait">
    <adaptation id="fullscreen"/>
    </device>
    <dependencies>
    <deployment identifier="iOS"/>
    <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="14460.20"/>
    <capability name="Safe area layout guides" minToolsVersion="9.0"/>
    <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
    <!--View Controller-->
    <scene sceneID="EHf-IW-A2E">
    <objects>
    <viewController id="01J-lp-oVM" sceneMemberID="viewController">
    <view key="view" contentMode="scaleToFill" id="Ze5-6b-2t3">
    <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
    <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
    <subviews>
    <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="
    """
    
    public static var launchscreenPart2 = """
    " textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="sPt-pW-s6Y">
    <rect key="frame" x="71" y="291.5" width="233" height="36"/>
    <fontDescription key="fontDescription" type="boldSystem" pointSize="30"/>
    <nil key="textColor"/>
    <nil key="highlightedColor"/>
    </label>
    <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="powered by iLogYou" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="NrK-q3-1Ak">
    <rect key="frame" x="100" y="603" width="175.5" height="24"/>
    <fontDescription key="fontDescription" type="system" pointSize="20"/>
    <nil key="textColor"/>
    <nil key="highlightedColor"/>
    </label>
    </subviews>
    <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
    <constraints>
    <constraint firstItem="sPt-pW-s6Y" firstAttribute="centerY" secondItem="Ze5-6b-2t3" secondAttribute="centerY" constant="-24" id="Kdz-Va-Di4"/>
    <constraint firstItem="NrK-q3-1Ak" firstAttribute="centerX" secondItem="Ze5-6b-2t3" secondAttribute="centerX" id="coc-3a-S8g"/>
    <constraint firstItem="6Tk-OE-BBY" firstAttribute="bottom" secondItem="NrK-q3-1Ak" secondAttribute="bottom" constant="40" id="dfo-yl-UZ3"/>
    <constraint firstItem="sPt-pW-s6Y" firstAttribute="centerX" secondItem="Ze5-6b-2t3" secondAttribute="centerX" id="kcn-jV-XdE"/>
    </constraints>
    <viewLayoutGuide key="safeArea" id="6Tk-OE-BBY"/>
    </view>
    </viewController>
    <placeholder placeholderIdentifier="IBFirstResponder" id="iYj-Kq-Ea1" userLabel="First Responder" sceneMemberID="firstResponder"/>
    </objects>
    <point key="canvasLocation" x="52" y="374.66266866566718"/>
    </scene>
    </scenes>
    </document>
    """
    
    public static var contents1 = """
    {
      "info" : {
      "version" : 1,
      "author" : "xcode"
    }
    }
    """
    
    public static var contents2 = """
    {
      "images" : [
        {
          "idiom" : "iphone",
          "size" : "20x20",
          "scale" : "2x"
        },
        {
          "idiom" : "iphone",
          "size" : "20x20",
          "scale" : "3x"
        },
        {
          "idiom" : "iphone",
          "size" : "29x29",
          "scale" : "2x"
        },
        {
          "idiom" : "iphone",
          "size" : "29x29",
          "scale" : "3x"
        },
        {
          "idiom" : "iphone",
          "size" : "40x40",
          "scale" : "2x"
        },
        {
          "idiom" : "iphone",
          "size" : "40x40",
          "scale" : "3x"
        },
        {
          "idiom" : "iphone",
          "size" : "60x60",
          "scale" : "2x"
        },
        {
          "idiom" : "iphone",
          "size" : "60x60",
          "scale" : "3x"
        },
        {
          "idiom" : "ipad",
          "size" : "20x20",
          "scale" : "1x"
        },
        {
          "idiom" : "ipad",
          "size" : "20x20",
          "scale" : "2x"
        },
        {
          "idiom" : "ipad",
          "size" : "29x29",
          "scale" : "1x"
        },
        {
          "idiom" : "ipad",
          "size" : "29x29",
          "scale" : "2x"
        },
        {
          "idiom" : "ipad",
          "size" : "40x40",
          "scale" : "1x"
        },
        {
          "idiom" : "ipad",
          "size" : "40x40",
          "scale" : "2x"
        },
        {
          "idiom" : "ipad",
          "size" : "76x76",
          "scale" : "1x"
        },
        {
          "idiom" : "ipad",
          "size" : "76x76",
          "scale" : "2x"
        },
        {
          "idiom" : "ipad",
          "size" : "83.5x83.5",
          "scale" : "2x"
        },
        {
          "idiom" : "ios-marketing",
          "size" : "1024x1024",
          "scale" : "1x"
        }
      ],
      "info" : {
        "version" : 1,
        "author" : "xcode"
      }
    }
    """
    
    public static var loginController = """
    import UIKit
    
    class LoginViewController: UIViewController {
        
        public var label: UILabel!
        
        public var username: UITextField!
        public var password: UITextField!
        
        var signUpButton: UIButton!
        var logInButton: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            addLabel()
            addTextFields()
            addButtons()
            self.logInButton.addTarget(self, action: #selector(logInButtonEvent), for: .touchUpInside)
            self.signUpButton.addTarget(self, action: #selector(signUpButtonEvent), for: .touchUpInside)
            self.view.backgroundColor = UIColor.white
        }
        
        func addTextFields() {
            username = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 - 30, width: self.view.frame.width - 100, height: 48))
            username.borderStyle = .roundedRect
            username.placeholder = "email"
            username.spellCheckingType = .no
            username.becomeFirstResponder()
            username.returnKeyType = .next
            self.view.addSubview(username)
            
            password = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 + 30, width: self.view.frame.width - 100, height: 48))
            password.isSecureTextEntry = true
            password.placeholder = "password"
            password.borderStyle = .roundedRect
            password.spellCheckingType = .no
            password.returnKeyType = .done
            self.view.addSubview(password)
        }
        
        func addButtons() {
            logInButton = UIButton(type: .system)
            logInButton.frame = CGRect(x: 0, y: self.view.frame.height - 64, width: self.view.frame.width, height: 64)
            logInButton.setTitle("Log in", for: .normal)
            logInButton.setTitleColor(.white, for: .normal)
            logInButton.backgroundColor = UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1))
            logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            logInButton.layer.cornerRadius = 0
            logInButton.layer.masksToBounds = true
            self.view.addSubview(logInButton)
            
            signUpButton = UIButton(type: .system)
            signUpButton.frame = CGRect(x: 0, y: (self.view.frame.height-200)/2 + 70, width: self.view.frame.width, height: 64)
            signUpButton.setTitle("Not registered yet", for: .normal)
            signUpButton.setTitleColor(UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1)), for: .normal)
            signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
            self.view.addSubview(signUpButton)
        }
        
        func addLabel(){
            label = UILabel(frame: CGRect(x: 50, y: 100, width: self.view.frame.width, height: 48))
            label.text = "Log In"
            label.textColor = UIColor.black
            label.font = UIFont.boldSystemFont(ofSize: 30)
            self.view.addSubview(label)
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == username {
                password.becomeFirstResponder()
            }
            else {
                self.view.endEditing(true)
            }
            return false
        }
        
        @IBAction func logInButtonEvent(sender: UIButton){
            print("hello")
        }
        
        @IBAction func signUpButtonEvent(sender: UIButton){
            let viewController = SignUpViewController()
            self.present(viewController, animated: false, completion: nil)
        }

    }
    """
}
