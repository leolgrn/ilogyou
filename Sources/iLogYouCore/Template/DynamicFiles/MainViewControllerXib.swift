import Foundation

public class MainViewControllerXib: DynamicFile {
    
    public var configuration: Configuration
    public var path: String
    
    public init(configuration: Configuration){
        self.configuration = configuration
        self.path = "\(configuration.projectName)/\(configuration.projectName)/View/MainViewController.xib"
    }

    public func content() -> String {
        return """
        <?xml version="1.0" encoding="UTF-8"?>
        <document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="14460.31" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
            <device id="retina4_7" orientation="portrait">
                <adaptation id="fullscreen"/>
            </device>
            <dependencies>
                <deployment identifier="iOS"/>
                <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="14460.20"/>
                <capability name="Safe area layout guides" minToolsVersion="9.0"/>
                <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
            </dependencies>
            <objects>
                <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner" customClass="MainViewController" customModule="\(self.configuration.projectName)" customModuleProvider="target">
                    <connections>
                        <outlet property="view" destination="i5M-Pr-FkT" id="sfx-zR-JGt"/>
                    </connections>
                </placeholder>
                <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
                <view clearsContextBeforeDrawing="NO" contentMode="scaleToFill" id="i5M-Pr-FkT">
                    <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                    <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                    <subviews>
                        <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="\(self.configuration.projectName) main page" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="Vad-hf-0gu">
                            <rect key="frame" x="83" y="315.5" width="209" height="36"/>
                            <fontDescription key="fontDescription" type="boldSystem" pointSize="30"/>
                            <nil key="textColor"/>
                            <nil key="highlightedColor"/>
                        </label>
                    </subviews>
                    <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                    <constraints>
                        <constraint firstItem="Vad-hf-0gu" firstAttribute="centerX" secondItem="i5M-Pr-FkT" secondAttribute="centerX" id="HaF-bG-E4g"/>
                        <constraint firstItem="Vad-hf-0gu" firstAttribute="centerY" secondItem="i5M-Pr-FkT" secondAttribute="centerY" id="RHq-8F-JsM"/>
                    </constraints>
                    <viewLayoutGuide key="safeArea" id="fnl-2z-Ty3"/>
                </view>
            </objects>
        </document>
        """
    }

}
