import RxSwift

struct GetTrips: GetTripsUseCase {

  private let repository: MapsRepository
  
  init(repository: MapsRepository) {
    self.repository = repository
  }
  
  func execute() -> Single<[Trip]> {
    return repository.getTrips()
  }
  
}
