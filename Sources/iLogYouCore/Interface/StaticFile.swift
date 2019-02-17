import Foundation

public protocol StaticFile {
    var path: String { get set }
    var content: String { get set }
}
