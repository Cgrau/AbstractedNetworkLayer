// MARK: - TripsApiResponse
typealias TripsApiResponse = [TripApiResponse]

// MARK: - TripApiResponse
struct TripApiResponse: Encodable, Decodable {
  let description, driverName, route, status: String?
  let origin: DestinationApiResponse?
  let stops: [StopApiResponse]?
  let destination: DestinationApiResponse?
  let endTime, startTime: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    description = try? values.decode(String.self, forKey: .description)
    driverName = try? values.decode(String.self, forKey: .driverName)
    route = try? values.decode(String.self, forKey: .route)
    status = try? values.decode(String.self, forKey: .status)
    origin = try? values.decode(DestinationApiResponse.self, forKey: .stops)
    stops = try? values.decode([StopApiResponse].self, forKey: .stops)
    destination = try? values.decode(DestinationApiResponse.self, forKey: .destination)
    endTime = try? values.decode(String.self, forKey: .endTime)
    startTime = try? values.decode(String.self, forKey: .startTime)
  }
}

// MARK: - Destination
struct DestinationApiResponse: Codable {
  let address: String?
  let point: PointApiResponse?
}

// MARK: - Point
struct PointApiResponse: Codable {
  let latitude, longitude: Double?
  
  enum CodingKeys: String, CodingKey {
    case latitude = "_latitude"
    case longitude = "_longitude"
  }
}

// MARK: - Stop
struct StopApiResponse: Codable {
  let id: Int?
  let point: PointApiResponse?
}
