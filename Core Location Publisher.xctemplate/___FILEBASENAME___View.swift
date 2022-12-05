import Combine
import SwiftUI

/// This is the example on how all the ViewModels and Publisher interact with each other and with the
struct ___VARIABLE_basename___View: View {
    @ObservedObject var viewModel = ___VARIABLE_basename___ViewModel()

    var body: some View {
        switch viewModel.status {
        case .authorizedAlways,
             .authorizedWhenInUse:
            return AnyView(locationData)
        default:
            return AnyView(currentStatus)
        }
    }

    var currentStatus: some View {
        VStack {
            Text(viewModel.status.description)
        }
        .alert(isPresented: .constant(viewModel.needPermission || viewModel.needChangeSettings)) {
            if viewModel.needPermission {
                return Alert(
                    title: Text("Privacy permission requested"),
                    message: Text("To use the app´s functionality, you need to agree ....."),
                    primaryButton: Alert.Button.default(Text("Yes"), action: {
                        self.viewModel.requestAuthorisation()
                    }),
                    secondaryButton: .destructive(Text("No"), action: {})
                )
            } else {
                return Alert(
                    title: Text("Permission´s change"),
                    message: Text("Please switch to the iOS Settings app to change the privacy setting for location to .... `always allow`"),
                    primaryButton: Alert.Button.default(Text("Switch to Settings"), action: {
                        self.viewModel.switchToSettings()
                    }),
                    secondaryButton: .destructive(Text("No"), action: {})
                )
            }
        }
    }

    var locationData: some View {
        VStack(alignment: .leading) {
            Text("Location").font(.headline)

            Text("Status:")
            Text("\(viewModel.status.description)").font(.subheadline)
            Text("Latitude: \(viewModel.coordinate.latitude)")
            Text("Longitude: \(viewModel.coordinate.longitude)")
            Text("Heading: \(viewModel.heading)")
            Spacer()
        }
    }
}

struct ___VARIABLE_basename___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_basename___View()
    }
}
