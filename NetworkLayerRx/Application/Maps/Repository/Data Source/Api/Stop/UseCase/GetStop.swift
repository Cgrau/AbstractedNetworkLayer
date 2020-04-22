import RxSwift

struct GetStop: GetStopUseCase {

  private let repository: MapsRepository
  
  init(repository: MapsRepository) {
    self.repository = repository
  }
  
  func execute(request: StopRequest) -> Single<Stop> {
    return repository.getStop(request: request)
  }
}
