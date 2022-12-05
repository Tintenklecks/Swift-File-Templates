import SwiftUI

// MARK: - ViewModel of ___VARIABLE_className___View

extension ___VARIABLE_className___View {
    class ViewModel: ObservableObject {
        @Published var posts: [DummyPostStructure] = []
        
        var model = Model()
        
        func setDataService(_ dataService: DataServiceProtocol) {
            model.dataService = dataService
        }
        
        func reload() {
            model.fetch { [self] result in
                switch result {
                case .success():
                    // Add model data to vm data
                    DispatchQueue.main.async {
                        self.posts = self.model.result.map { $0 }
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
    
