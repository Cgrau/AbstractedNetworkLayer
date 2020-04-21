import Moya

enum TripsService: TargetType {
  case trips
}

extension TripsService {
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

private func endpoint(for service: TripsService) -> Endpoint {
  switch service {
  case .trips:
    return TripsEndpoint()
  }
}
