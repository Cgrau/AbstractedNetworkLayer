import Moya

enum MapsService: TargetType {
  case trips
  case stop(StopRequest)
}

extension MapsService {
  var baseURL: URL {
    return Service.baseUrl
  }
  
  var path: String {
    return endpoint(for: self).path
  }
  
  var method: Moya.Method {
    return endpoint(for: self).method
  }
  
  var task: Task {
    return endpoint(for: self).task
  }
}

private func endpoint(for service: MapsService) -> Endpoint {
  switch service {
  case .trips:
    return TripsEndpoint()
  case .stop(let request):
    return StopEndpoint(request: request)
  }
}
