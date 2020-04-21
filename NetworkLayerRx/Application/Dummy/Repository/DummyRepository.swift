import RxSwift

struct DummyRepository {
  private let apiDataSource: DummyDataSource
  
  init(apiDataSource: DummyDataSource) {
    self.apiDataSource = apiDataSource
  }
  
  func getDummy(request: DummyRequest) -> Single<Dummy> {
    apiDataSource.getDummy(request: request)
  }
}
