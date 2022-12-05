import Foundation

class ___VARIABLE_basename___Service {
    private func url(language: String = "en", latitude: Double, longitude: Double) -> URL? {
        return URL(
            string: "https://\(language).wikipedia.org/w/api.php?ggscoord=\(latitude)|\(longitude)&action=query&prop=coordinates|pageimages|pageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json".replacingOccurrences(of: "|", with: "%7C")
        )
    }
    
    func fetchAPIData(at latitude: Double, longitude: Double, completion: @escaping (___VARIABLE_basename___Result?) -> ()) {
        guard let url = url(latitude: latitude, longitude: longitude) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            var jsonData = data
            
            #if DEBUG
            if error != nil {
                jsonData = try? Data(contentsOf: Bundle.main
                    .url(forResource: "___FILEBASENAME___Mock", withExtension: "json")!)
            }
            #endif
            
            guard let data = jsonData else {
                completion(nil)
                return
            }
            
            do {
                let model = try JSONDecoder().decode(___VARIABLE_basename___Result.self, from: data)
                completion(model)
            } catch let error  {
                print("#\(error)")
                completion(nil)
            }
            
        }.resume()
    }
}
