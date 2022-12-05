import Combine
import SwiftUI

/// This is the example on how all the ViewModels and Publisher interact with each other and with the
struct ___VARIABLE_basename___View: View {
    @ObservedObject var viewModel = ___VARIABLE_basename___ViewModel()

    var body: some View {
        Form {
            Section(header: Text("Rates for \(self.viewModel.date.debugDescription)")) {
                DatePicker("Rates for date", selection: $viewModel.date, in: ...Date(), displayedComponents: .date)
                    .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("ECB Exchange Rates:").font(.headline)) {
                listContent
            }
        }.onAppear {
            self.viewModel.date = Date()
            print(self.viewModel.errorMessage)
        }
    }

    var listContent: some View {
        switch self.viewModel.state {
        case .idle:
            return AnyView(Text("Not yet loaded any data").foregroundColor(.blue))
        case .loading:
            return AnyView(Text("Loading data").foregroundColor(.orange))
        case .loaded:
            return AnyView(currencyExchangeList)
        case .error:
            return AnyView(
                VStack {
                    Text("Error").foregroundColor(.red)
                    Text(self.viewModel.errorMessage)
                }
            )
        }
    }

    var currencyExchangeList: some View {
        List(self.viewModel.rates) { rate in
            HStack {
                Text(rate.currency).font(.headline)
                Spacer()
                Text("\(rate.rate)").font(.headline)
            }
        }
    }
}

struct ___VARIABLE_basename___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_basename___View()
    }
}
