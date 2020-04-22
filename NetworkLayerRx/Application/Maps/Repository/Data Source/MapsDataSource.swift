import RxSwift

protocol MapsDataSource {
  func getTrips() -> Single<[Trip]>
  func getStop(request: StopRequest) -> Single<Stop>
}
