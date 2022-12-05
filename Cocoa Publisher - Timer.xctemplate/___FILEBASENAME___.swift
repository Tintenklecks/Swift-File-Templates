
import Combine
import Foundation

/// **___VARIABLE_basename___ViewModel** ist a ViewModel for a Standard Timer publisher
/// which can be easily adopted to any other standard publisher iOS 13++ offers

class ___VARIABLE_basename___ViewModel: ObservableObject {
    private let secondsAtStart = Date().timeIntervalSince1970 // Seconds since 1.1.1970 when publisher started
    @Published var seconds: Int = 0 // Seconds since

    private var timerPublisherEvent: AnyCancellable?

    init() {
        /// The timerPublisherEvent has to be assigned in init, because
        /// it assigns a self property, which is not accessible in the
        /// declaration. if that´s not needed, you can use a **private let**
        /// and assign the publisher directly

        timerPublisherEvent = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .default)
            .autoconnect().sink {
                value in
                self.seconds = Int(value.timeIntervalSince1970 - self.secondsAtStart)
            }
    }
}
