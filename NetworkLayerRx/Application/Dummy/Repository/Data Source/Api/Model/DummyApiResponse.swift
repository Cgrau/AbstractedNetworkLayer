struct DummyApiResponse: Codable {
  
  var uuid: String?
  var firstName: String?
  var lastName: String?
  
  enum CodingKeys: String, CodingKey {
    case uuid = "uuid"
    case firstName = "first_name"
    case lastName = "last_name"
  }
}
