import RxSwift
import Moya

extension ObservableType {
  func asCompletable() -> Completable {
    return ignoreElements()
  }
}

extension PrimitiveSequence where Trait == SingleTrait {
  func asCompletable() -> Completable {
    return asObservable().asCompletable()
  }
}

extension PrimitiveSequence where Trait == MaybeTrait {
  func asCompletable() -> Completable {
    return asObservable().asCompletable()
  }
}

extension PrimitiveSequence where Trait == SingleTrait {
  func flatMapCompletable(_ transform: @escaping (Element) -> Completable) -> Completable {
    return asObservable().flatMap { element -> Observable<Never> in
      transform(element).asObservable()
    }.asCompletable()
  }
}

extension PrimitiveSequence where Trait == SingleTrait {
  func asCompletableOrError(_ f: @escaping (Any, Error) throws -> Error) -> Completable {
    return try asObservable().asCompletable()
      .catchError { error in
        throw try self.extract(error, f)
    }
  }
  private func extract(_ error: Error, _ f: @escaping (Any, Error) throws -> Error) throws -> Error {
    guard let moyaError = error as? MoyaError,
      let json = try moyaError.response?.mapJSON() else {
        throw error
    }
    return try f(json, error)
  }
}
