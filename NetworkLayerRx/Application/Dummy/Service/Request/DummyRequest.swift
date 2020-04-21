import Foundation

public struct DummyRequest {
  public let firstName: String
  public let lastName: String
  
  public init(firstName: String,
              lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}
