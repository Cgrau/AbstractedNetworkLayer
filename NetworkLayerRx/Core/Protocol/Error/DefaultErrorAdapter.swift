import Moya

public struct PlainError: Error {
  public let message: String
  public let statusCode: Int
  public let internalCode: String
  
  public init(message: String,
              statusCode: Int,
              internalCode: String) {
    self.message = message
    self.statusCode = statusCode
    self.internalCode = internalCode
  }
  
  public static var mock: PlainError {
    return PlainError(message: "Mock error",
                      statusCode: 500,
                      internalCode: "040103")
  }
}

//You can create a new one conforming the protocol and init ErrorAdapter with it
struct DefaultErrorConfiguration: ErrorAdapterConfiguration {
  var messageKey = "message"
  var internalCodeKey = "internal_code"
  var defaultErrorMessage = ""
  var defaultStatusCode = Int(0)
  var defaultInternalCode = ""
}

struct DefaultErrorAdapter: ErrorAdapter {
  var messageKey: String
  var internalCodeKey: String
  var defaultErrorMessage: String
  var defaultStatusCode: Int
  var defaultInternalCode: String
  
  init(configuration: ErrorAdapterConfiguration) {
    messageKey = configuration.messageKey
    internalCodeKey = configuration.internalCodeKey
    defaultErrorMessage = configuration.defaultErrorMessage
    defaultStatusCode = configuration.defaultStatusCode
    defaultInternalCode = configuration.defaultInternalCode
  }
  
  func make(_ input: ErrorAdapter.Input, _ error: Error) throws -> Error {
    let errorMessage = message(for: error)
    let moyaError = error as? MoyaError
    let statusCode = moyaError?.response?.statusCode ?? defaultStatusCode
    let intCode = internalCode(for: error)
    throw PlainError(message: errorMessage,
                     statusCode: statusCode,
                     internalCode: intCode)
  }
  
  private func message(for error: Error) -> String {
    guard let json = mapJSON(from: error) else { return defaultErrorMessage }
    guard let message = json[messageKey] as? String else { return defaultErrorMessage }
    return message
  }
  
  private func internalCode(for error: Error) -> String {
    guard let json = mapJSON(from: error) else { return defaultInternalCode }
    guard let code = json[internalCodeKey] as? String else { return defaultInternalCode }
    return code
  }
  
  private func mapJSON(from error: Error) -> [AnyHashable: Any]? {
    guard let moyaError = error as? MoyaError else { return nil }
    do {
      guard let json = try moyaError.response?.mapJSON() as? [AnyHashable: Any] else { return nil }
      return json
    } catch { return nil }
  }
}
