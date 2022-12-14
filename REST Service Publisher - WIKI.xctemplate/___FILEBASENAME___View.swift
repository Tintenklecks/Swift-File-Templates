import Combine
import SwiftUI

/// This is the example on how all the ViewModels and Publisher interact with each other and with the

struct ___VARIABLE_basename___View: View {
    @ObservedObject var viewModel = ___VARIABLE_basename___ViewModel()
    
    @State var latitude: String = "47.2897"
    @State var longitude: String = "7.9458"
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Geographic Coordinates")
                .font(.headline)
            
            HStack {
                Text("Latitude").font(.caption)
                TextField("Latitude", text: $latitude)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                Spacer().padding()
                Text("Longitude").font(.caption)
                
                TextField("Longitude", text: $longitude)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            Button(action: {
                self.viewModel.setLocation(
                    latitude: Double(self.latitude) ?? 0,
                    longitude: Double(self.longitude) ?? 0
                )
                
            }) {
                Text("Get WIKI entries")
                    .padding(.horizontal, 32)
            }
            .foregroundColor(.white)
            .padding()
            .background(
                Color.accentColor
                    .clipShape(Capsule())
            )
            
            Divider().padding(.top, 16)
            
            Text("Wikipedia entries :").font(.headline)
                .padding(.top, 32)
            
            List(viewModel.pages) { page in
                
                HStack {
                    Text(page.name)
                    Spacer()
                    Text("\(Int(page.distance)) m")
                    Spacer()
                    Text("\(page.latitude)")
                    Text("\(page.longitude)")
                }
            }
        }
        .padding()
        .navigationBarTitle("Wikipedia Entries by Geo Location")
    }
}

struct ___VARIABLE_basename___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_basename___View()
    }
}
