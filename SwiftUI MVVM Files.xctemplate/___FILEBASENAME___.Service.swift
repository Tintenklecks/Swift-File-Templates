import Foundation

// MARK: - ___VARIABLE_className___EndPoints

enum ___VARIABLE_className___EndPoints: String, EndpointProtocol {
    case posts = "/posts"

    
    var url: URL {
        return host.appendingPathComponent(rawValue)
    }

    var mockUrl: URL {
        return mockHost.appendingPathComponent(mockFileName)
    }

    private var host: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }

    private var mockFileName: String {
        "\(NSString(string: rawValue).lastPathComponent).json"
    }
    private var mockHost: URL {
        // from Bundle:
        // return Bundle.main.resourceURL!
        
        // from (writable) Documents folder
        // Step 1 copy from bundle if necessary
        try? FileManager.copyToDocuments(fileName: mockFileName, always: false)
        return FileManager.documentUrl
    }



}


extension ___VARIABLE_className___View {
    // MARK: - MockService
    
    class MockService: GenericDataService, DataServiceProtocol {
        
        func load<T>(from endpoint: EndpointProtocol, convertTo type: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
            
            load(from: endpoint.mockUrl, convertTo: type, completion: completion)

        }
    }
    
    // MARK: - NetworkService
    
    class NetworkService: GenericDataService, DataServiceProtocol {
        
        func load<T>(from endpoint: EndpointProtocol, convertTo type: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {

            load(from: endpoint.url, convertTo: type, completion: completion)

        }
        
    }
}
