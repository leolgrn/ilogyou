
import iLogYouCore

let tool = iLogYou()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
