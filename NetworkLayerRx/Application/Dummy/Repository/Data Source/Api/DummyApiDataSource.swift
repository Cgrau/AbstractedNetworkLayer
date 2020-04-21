import RxSwift
import Moya

struct DummyApiDataSource: DummyDataSource {
  
  private let provider: MoyaProvider<DummyService>
  private let errorAdapter: ErrorAdapter
  private let dummyApiToDomainMapper: DummyApiToDomainMapper
  
  init(provider: MoyaProvider<DummyService>,
       errorAdapter: ErrorAdapter,
       dummyApiToDomainMapper: DummyApiToDomainMapper) {
    self.provider = provider
    self.errorAdapter = errorAdapter
    self.dummyApiToDomainMapper = dummyApiToDomainMapper
  }
  
  func getDummy(request: DummyRequest) -> Single<Dummy> {
    return provider.rx
      .request(.dummy(request))
      .filterSuccessfulStatusCodes()
      .mapOrError(DummyApiResponse.self, errorAdapter.make)
      .map(dummyApiToDomainMapper.map)
  }
}
