import RxSwift
import Moya

extension PrimitiveSequence where Trait == RxSwift.SingleTrait, Element == Moya.Response {
  func mapOrError<D>(_ type: D.Type, _ f: @escaping (Any, Error) throws -> Error) -> Single<D> where D: Decodable {
    return self.map(type)
      .catchError { error in
        throw try self.extract(error, f)
    }
  }
  
  func mapOrErrorWithKeyPath<D>(_ type: D.Type, _ keyPath: String, _ f: @escaping (Any, Error) throws -> Error) -> Single<D> where D: Decodable {
    return self.map(type, atKeyPath: keyPath, using: JSONDecoder(), failsOnEmptyData: false)
      .catchError { error in
        throw try self.extract(error, f)
    }
  }

  func orError(_ f: @escaping (Any, Error) throws -> Error) {
    
  }

  private func extract(_ error: Error, _ f: @escaping (Any, Error) throws -> Error) throws -> Error {
    guard let moyaError = error as? MoyaError,
      let json = try moyaError.response?.mapJSON() else {
        throw error
    }
    return try f(json, error)
  }
}