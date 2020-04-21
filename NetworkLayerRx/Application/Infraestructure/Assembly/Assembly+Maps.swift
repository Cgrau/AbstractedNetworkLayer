extension Assembly {
  public var getTrips: GetTripsUseCase {
    return GetTrips(repository: mapsRepository)
  }
  
  var mapsRepository: MapsRepository {
    return MapsRepository(apiDataSource: mapsDataSource)
  }
  
  private var mapsDataSource: MapsDataSource {
    return MapsApiDataSource(provider: moya(),
                             errorAdapter: errorAdapter,
                             tripsApiToDomainMapper: TripsApiToDomainMapper())
  }
}
