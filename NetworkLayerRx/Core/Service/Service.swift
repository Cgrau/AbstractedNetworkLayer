import Foundation

public struct Service {
  public static var baseUrl: URL {
    return URL(string: resolver.baseURL)!
  }
}
