extension Assembly {
  public var getTrips: GetTripsUseCase {
    return GetTrips(repository: mapsRepository)
  }
  
  public var getStop: GetStopUseCase {
    return GetStop(repository: mapsRepository)
  }
  
  var mapsRepository: MapsRepository {
    return MapsRepository(apiDataSource: mapsDataSource)
  }
  
  private var mapsDataSource: MapsDataSource {
    return MapsApiDataSource(provider: moya(),
                             errorAdapter: errorAdapter,
                             tripsApiToDomainMapper: TripsApiToDomainMapper(),
                             stopApiToDomainMapper: StopApiToDomainMapper())
  }
}
