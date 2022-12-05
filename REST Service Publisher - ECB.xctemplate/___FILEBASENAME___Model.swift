import Foundation

/// This is the model file of the ___VARIABLE_basename___ Service Request

// MARK: - Data Model -

struct ___VARIABLE_basename___Model: Codable {
    let base: String
    let rates: [String: Double]
    let date: String
}

// MARK: - Error Model -
struct ___VARIABLE_basename___ErrorModel: Codable {
    let error: String
}
