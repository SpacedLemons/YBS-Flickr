import Foundation

extension DispatchQueue {
    static func asyncMain(execute work: @escaping () -> Void) {
        DispatchQueue.main.async(execute: work)
    }
    
    static func globalAsync(qos: DispatchQoS.QoSClass = .default, execute work: @escaping () -> Void) {
        DispatchQueue.global(qos: qos).async(execute: work)
    }
}
