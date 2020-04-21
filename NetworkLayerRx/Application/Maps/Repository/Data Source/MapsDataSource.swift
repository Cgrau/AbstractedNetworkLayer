import RxSwift

protocol MapsDataSource {
  func getTrips() -> Single<[Trip]>
//  func getStops() -> Single<String>
}
