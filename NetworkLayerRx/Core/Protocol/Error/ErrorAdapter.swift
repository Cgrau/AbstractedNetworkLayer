import Foundation

protocol ErrorAdapter {
  typealias Input = Any
  func make(_ input: Input, _ error: Error) throws -> Error
}

protocol ErrorAdapterConfiguration {
  var messageKey: String { get set }
  var internalCodeKey: String { get set }
  var defaultErrorMessage: String { get set }
  var defaultStatusCode: Int { get set }
  var defaultInternalCode: String { get set }
}
