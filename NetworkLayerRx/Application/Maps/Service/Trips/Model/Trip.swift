import Foundation

// MARK: - Trip
public struct Trip {
  let description, driverName, route: String?
  let status: TripStatus?
  let origin: TripDestination?
  let stops: [TripStop]?
  let destination: TripDestination?
  let endTime, startTime: String?
}

// MARK: - Status
public enum TripStatus: String, Codable {
  case ongoing, scheduled, finalized, cancelled, none
}

// MARK: - Destination
public struct TripDestination {
  let address: String?
  let point: TripPoint?
}

// MARK: - Point
public struct TripPoint {
  let latitude, longitude: Double?
}

// MARK: - Stop
public struct TripStop {
  let id: Int?
  let point: TripPoint?
}
