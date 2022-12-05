import Foundation
import CoreLocation


class ___VARIABLE_basename___ViewModel: ObservableObject {
    @Published var pages: [___VARIABLE_basename___Entry] = []
    private var location: CLLocation = CLLocation()
    init() {
        pages = []
    }

    func setLocation(latitude: Double, longitude: Double) {
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        pages = []
        ___VARIABLE_basename___Service().fetchAPIData(at: latitude, longitude: longitude) { model in

            if let model = model {
                let pages = model.query.pages
                for (id, page) in pages {
                    let entryLocation = CLLocation(latitude: page.coordinates.first?.lat ?? 0, longitude: page.coordinates.first?.lon ?? 0)
                    
                    let viewModelEntry = ___VARIABLE_basename___Entry(
                        id: "\(id)",
                        name: page.title,
                        latitude: entryLocation.coordinate.latitude,
                        longitude: entryLocation.coordinate.longitude,
                        distance: entryLocation.distance(from: self.location))
                    DispatchQueue.main.async {
                        self.pages.append(viewModelEntry)
                    }
                }
            }
        }
    }
}

struct ___VARIABLE_basename___Entry: Identifiable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let distance: Double
}
