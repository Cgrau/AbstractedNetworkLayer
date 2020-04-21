import RxSwift

struct MapsRepository {
  private let apiDataSource: MapsDataSource
  
  init(apiDataSource: MapsDataSource) {
    self.apiDataSource = apiDataSource
  }
  
  func getTrips() -> Single<[Trip]> {
    apiDataSource.getTrips()
  }
}
