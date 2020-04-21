public struct Dummy: Codable {
  
  public let uuid: String?
  public let firstName: String?
  public let lastName: String?
  
  public init(uuid: String?,
              firstName: String?,
              lastName: String?) {
    self.uuid = uuid
    self.firstName = firstName
    self.lastName = lastName
  }
}
