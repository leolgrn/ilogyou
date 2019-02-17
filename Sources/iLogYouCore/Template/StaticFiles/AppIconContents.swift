import Foundation

public class AppIconContents: StaticFile {
    
    public var path: String
    
    public init(configuration: Configuration){
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets/AppIcon.appiconset/Content.json"
    }

    public var content = """
    {
        "images": [{
                "idiom": "iphone",
                "size": "20x20",
                "scale": "2x"
            },
            {
                "idiom": "iphone",
                "size": "20x20",
                "scale": "3x"
            },
            {
                "idiom": "iphone",
                "size": "29x29",
                "scale": "2x"
            },
            {
                "idiom": "iphone",
                "size": "29x29",
                "scale": "3x"
            },
            {
                "idiom": "iphone",
                "size": "40x40",
                "scale": "2x"
            },
            {
                "idiom": "iphone",
                "size": "40x40",
                "scale": "3x"
            },
            {
                "idiom": "iphone",
                "size": "60x60",
                "scale": "2x"
            },
            {
                "idiom": "iphone",
                "size": "60x60",
                "scale": "3x"
            },
            {
                "idiom": "ipad",
                "size": "20x20",
                "scale": "1x"
            },
            {
                "idiom": "ipad",
                "size": "20x20",
                "scale": "2x"
            },
            {
                "idiom": "ipad",
                "size": "29x29",
                "scale": "1x"
            },
            {
                "idiom": "ipad",
                "size": "29x29",
                "scale": "2x"
            },
            {
                "idiom": "ipad",
                "size": "40x40",
                "scale": "1x"
            },
            {
                "idiom": "ipad",
                "size": "40x40",
                "scale": "2x"
            },
            {
                "idiom": "ipad",
                "size": "76x76",
                "scale": "1x"
            },
            {
                "idiom": "ipad",
                "size": "76x76",
                "scale": "2x"
            },
            {
                "idiom": "ipad",
                "size": "83.5x83.5",
                "scale": "2x"
            },
            {
                "idiom": "ios-marketing",
                "size": "1024x1024",
                "scale": "1x"
            }
        ],
        "info": {
            "version": 1,
            "author": "xcode"
        }
    }
    """

}
