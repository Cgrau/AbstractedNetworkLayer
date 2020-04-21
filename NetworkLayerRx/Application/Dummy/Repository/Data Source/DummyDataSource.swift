import RxSwift

protocol DummyDataSource {
  func getDummy(request: DummyRequest) -> Single<Dummy>
}
