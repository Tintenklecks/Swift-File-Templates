import Foundation

/// ___VARIABLE_basename___ Model File


struct ___VARIABLE_basename___Result: Codable {
    let query: ___VARIABLE_basename___Query
}

struct ___VARIABLE_basename___Query: Codable {
    let pages: [Int: ___VARIABLE_basename___Page]
}



// MARK: - ___VARIABLE_basename___Page
class ___VARIABLE_basename___Page: Codable {
    let pageid: Int
    let title: String
    let coordinates: [___VARIABLE_basename___Coordinate]
    let thumbnail: ___VARIABLE_basename___Thumbnail?
//    let terms: ___VARIABLE_basename___Terms?


    init(pageid: Int, ns: Int, title: String, index: Int, coordinates: [___VARIABLE_basename___Coordinate], thumbnail: ___VARIABLE_basename___Thumbnail, terms: ___VARIABLE_basename___Terms) {
        self.pageid = pageid
        self.title = title
        self.coordinates = coordinates
        self.thumbnail = thumbnail
//        self.terms = terms
    }
}

// MARK: - ___VARIABLE_basename___Coordinate
class ___VARIABLE_basename___Coordinate: Codable {
    let lat: Double
    let lon: Double
    let primary: String
    let globe: String

    enum CodingKeys: String, CodingKey {
        case lat
        case lon
        case primary
        case globe
    }

    init(lat: Double, lon: Double, primary: String, globe: String) {
        self.lat = lat
        self.lon = lon
        self.primary = primary
        self.globe = globe
    }
}

// MARK: - ___VARIABLE_basename___Terms
class ___VARIABLE_basename___Terms: Codable {
    let termsDescription: [String]

    enum CodingKeys: String, CodingKey {
        case termsDescription
    }

    init(termsDescription: [String]) {
        self.termsDescription = termsDescription
    }
}

// MARK: - ___VARIABLE_basename___Thumbnail
class ___VARIABLE_basename___Thumbnail: Codable {
    let source: String
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case source
        case width
        case height
    }

    init(source: String, width: Int, height: Int) {
        self.source = source
        self.width = width
        self.height = height
    }
}
