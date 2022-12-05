import SwiftUI

// MARK: - CustomersView

struct ___VARIABLE_className___View: View {
    @StateObject var viewModel = ViewModel()
    let dataService: DataServiceProtocol
    
    var body: some View {
        List(viewModel.posts) { post in
            VStack(alignment: .leading) {
                Text(post.title).font(.headline)
                Text(post.body)
            }
        }
        .refreshable {
            viewModel.reload()
        }
        .onAppear {
            viewModel.setDataService(dataService)
            viewModel.reload()
        }
    }
}

// MARK: - Customers_Previews

struct ___VARIABLE_className____Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_className___View(dataService: ___VARIABLE_className___View.MockService())
    }
}

