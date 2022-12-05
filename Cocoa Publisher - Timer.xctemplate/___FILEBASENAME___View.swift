import SwiftUI
import Combine

/// This is the example on how all the ViewModels and Publisher interact with each other and with the
struct ___VARIABLE_basename___View: View {
    @ObservedObject var viewModel = ___VARIABLE_basename___ViewModel()
    var body: some View {
        VStack {
            Text("Timer:").font(.headline)
            
            Text("Seconds since Timer Start: \(viewModel.seconds)")
            Text(Date().debugDescription)
            Spacer()
        }


        
    }
}


struct ___VARIABLE_basename___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_basename___View()
    }
}
