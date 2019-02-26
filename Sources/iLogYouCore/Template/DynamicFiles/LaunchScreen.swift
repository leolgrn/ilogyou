import Foundation

public class LaunchScreen: DynamicFile {
    
    public var configuration: Configuration
    public var path: String
    
    public init(configuration: Configuration){
        self.configuration = configuration
        self.path = "\(configuration.projectName)/\(configuration.projectName)/View/Base.lproj/LaunchScreen.storyboard"
    }
    
    public func content() -> String {
        return """
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
                            <view key="view" clearsContextBeforeDrawing="NO" contentMode="scaleToFill" id="Vcd-Vf-1vt">
                                <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                                <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                                <subviews>
                                    <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="\(self.configuration.projectName)" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="4PM-yO-igu">
                                        <rect key="frame" x="156" y="315.5" width="63.5" height="36"/>
                                        <fontDescription key="fontDescription" type="boldSystem" pointSize="30"/>
                                        <nil key="textColor"/>
                                        <nil key="highlightedColor"/>
                                    </label>
                                    <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="powered by iLogYou" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="dqV-UG-0nn">
                                        <rect key="frame" x="100" y="603" width="175.5" height="24"/>
                                        <fontDescription key="fontDescription" type="system" pointSize="20"/>
                                        <nil key="textColor"/>
                                        <nil key="highlightedColor"/>
                                    </label>
                                </subviews>
                                <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <constraints>
                                    <constraint firstItem="4PM-yO-igu" firstAttribute="centerY" secondItem="Vcd-Vf-1vt" secondAttribute="centerY" id="0Kn-r4-dhf"/>
                                    <constraint firstItem="5V8-lu-gZG" firstAttribute="bottom" secondItem="dqV-UG-0nn" secondAttribute="bottom" constant="40" id="308-aF-kmu"/>
                                    <constraint firstItem="dqV-UG-0nn" firstAttribute="centerX" secondItem="Vcd-Vf-1vt" secondAttribute="centerX" id="O95-dx-ZA9"/>
                                    <constraint firstItem="4PM-yO-igu" firstAttribute="centerX" secondItem="Vcd-Vf-1vt" secondAttribute="centerX" id="ymw-2s-Q8P"/>
                                </constraints>
                                <viewLayoutGuide key="safeArea" id="5V8-lu-gZG"/>
                            </view>
                        </viewController>
                    <placeholder placeholderIdentifier="IBFirstResponder" id="iYj-Kq-Ea1" userLabel="First Responder" sceneMemberID="firstResponder"/>
                    </objects>
                    <point key="canvasLocation" x="53" y="375"/>
                </scene>
            </scenes>
        </document>
        """
    }
    
    
    
    
}
