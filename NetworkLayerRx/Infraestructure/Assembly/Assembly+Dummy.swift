import Moya

extension Assembly {
  var repository: DummyRepository {
    return DummyRepository(apiDataSource: apiDataSource)
  }
  
  private var apiDataSource: DummyApiDataSource {
    return DummyApiDataSource(provider: moya(),
                              errorAdapter: errorAdapter,
                              dummyApiToDomainMapper: DummyApiToDomainMapper())
  }
  
  private var dummyMapper: DummyApiToDomainMapper {
    return DummyApiToDomainMapper()
  }
}
