import Foundation

public final class Assembly {
  fileprivate static let shared = Assembly()
  var errorConfiguration: ErrorAdapterConfiguration = DefaultErrorConfiguration()
  var baseURL: String = "https://europe-west1-metropolis-fe-test.cloudfunctions.net/api/"
}

public var resolver: Assembly {
  return Assembly.shared
}
