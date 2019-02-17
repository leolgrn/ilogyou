import Foundation

public protocol DynamicFile {
    var path: String { get set }
    func content() -> String
}
