import Combine
import Foundation


class ___VARIABLE_basename___ViewModel: ObservableObject {
    @Published var rates: [___VARIABLE_basename___Record] = []
    @Published var state: ___VARIABLE_basename___ServiceState = .idle
    @Published var errorMessage: String = ""
    @Published var date: Date = Date()  {
        didSet {
            self.fetchData(date: self.date)
        }
    }


    var subscriber: AnyCancellable?

    func fetchData(date: Date? = nil) {
        self.state = .loading
        subscriber = ___VARIABLE_basename___Service().fetchAPIData(date: date).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.errorMessage = ""
                case .failure(let error):
                    self.state = .error
                    self.errorMessage = error.description
                    
                    print(error)
                }
            },
            receiveValue: { dictRates in
                self.rates = dictRates.map {
                    ___VARIABLE_basename___Record(currency: $0.key, rate: $0.value)
                }
                .sorted { model1, model2 in
                    model1.currency < model2.currency
                }
                self.state = .loaded
            }
        )
    }
}


extension ___VARIABLE_basename___ViewModel: Equatable {

  static func == (lhs: ___VARIABLE_basename___ViewModel, rhs: ___VARIABLE_basename___ViewModel) -> Bool {
//        return lhs.id == rhs.id
        return true
    }
}


// MARK: - other viewmodel related classes and structs

struct ___VARIABLE_basename___Record: Identifiable {
    let id: UUID = UUID()
    var currency: String
    var rate: Double
}