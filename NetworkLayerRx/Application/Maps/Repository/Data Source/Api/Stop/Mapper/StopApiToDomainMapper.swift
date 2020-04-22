import Foundation

struct StopApiToDomainMapper: Mappable {
  func map(data: Data?) -> Stop? {
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
  
  func map(_ from: StopApiResponse) throws -> Stop {
    return Stop(point: TripPoint(latitude: from.point.latitude,
                                 longitude: from.point.longitude),
                price: from.price,
                stopTime: from.stopTime,
                paid: from.paid,
                address: from.address,
                tripID: from.tripID,
                userName: from.userName)
  }
  
  private func decode(jsonDecoder: JSONDecoder, data: Data) throws -> Stop {
    let response = try jsonDecoder.decode(StopApiResponse.self, from: data)
    return try map(response)
  }
}
