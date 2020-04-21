import Foundation

struct DummyApiToDomainMapper: Mappable {
  func map(data: Data?) -> Dummy? {
    guard let data = data else {
      return nil
    }
    let jsonDecoder = JSONDecoder()
    do {
      return try decode(jsonDecoder: jsonDecoder, data: data)
    } catch  {
      return nil
    }
  }
  
  func map(_ from: DummyApiResponse) throws -> Dummy {
    return Dummy(uuid: from.uuid,
                 firstName: from.firstName,
                 lastName: from.lastName)
  }

  private func decode(jsonDecoder: JSONDecoder, data: Data) throws -> Dummy {
    let response = try jsonDecoder.decode(DummyApiResponse.self, from: data)
    return try map(response)
  }
}
