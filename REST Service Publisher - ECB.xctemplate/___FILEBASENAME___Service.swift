/// # This is the ___VARIABLE_basename___Service
/// The demo retrieves the data from the ratesapi.io REST service and decodes it to the ___VARIABLE_basename___Model model
import Combine
import Foundation

/// ___VARIABLE_basename___Error is the enum in which the error is passed back from the DataTask Publisher
enum ___VARIABLE_basename___Error: Error {
    case none, unknown
    case api(description: String)
    case decoding(description: String)
    case network(description: String)

    var description: String {
        switch self {
        case .none:
            return ""
        case .unknown:
            return "unknown"
        case .api(description: let description):
            return "API Error: \(description)"
        case .decoding(description: let description):
            return "Decoding Error: \(description)"
        case .network(description: let description):
            return "Network Error: \(description)"
        }
    }
}


enum ___VARIABLE_basename___ServiceState {
    case idle
    case loading
    case loaded
    case error
}


class ___VARIABLE_basename___Service {
    let url = "https://api.ratesapi.io/api/" // URL for the ___VARIABLE_basename___ request
    
    /// method to create a parameter for the ___VARIABLE_basename___ request. In this case the last path component needs to
    /// be **latest** for the current date or a date in the form **Y-M-d** (ie *2020-1-31*)
    func formattedDate(_ date: Date?) -> String {
        guard let date = date else {
            return "latest"
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "y-M-d"
        return formatter.string(from: date)

    }

    /// In the example call, the first parameter is the one, the datatask is called with and the result  **<String:Double>** is what the subscriber gets when calling the **fetchAPIData** 
    func fetchAPIData(date: Date? = nil) -> AnyPublisher<[String: Double], ___VARIABLE_basename___Error> {
        guard let url = URL(string: "\(self.url)\(formattedDate(date))") else {
            fatalError("URL invalid")
        }
        let request = URLRequest(url: url)

        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw ___VARIABLE_basename___Error.unknown
                }
                guard httpResponse.statusCode == 200 else {
                    throw ___VARIABLE_basename___Error.network(description: "Something wrong on line (Code: \(httpResponse.statusCode)")
                }

               guard httpResponse.statusCode == 200 else {
                    if let error = try? JSONDecoder().decode(___VARIABLE_basename___ErrorModel.self, from: data) {
                        throw ___VARIABLE_basename___Error.api(description: error.error)
                    } else {
                        throw ___VARIABLE_basename___Error.network(description: "Something wrong on line (Code: \(httpResponse.statusCode)")
                    }
                }

                return data
            }
            .decode(type: ___VARIABLE_basename___Model.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return ___VARIABLE_basename___Error.decoding(description: "Mapping Error: \(error.localizedDescription)")
            }
            .map {
                $0.rates
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
