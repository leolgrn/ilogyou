import Foundation

public class AssetsContents: StaticFile {

    public var path: String

    public init(configuration: Configuration){
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets/Content.json"
    }

    public var content = """
    {
        "info": {
            "version": 1,
            "author": "xcode"
        }
    }
    """

}
