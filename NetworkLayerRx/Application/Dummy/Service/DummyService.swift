import Moya

enum DummyService: TargetType {
  case dummy(DummyRequest)
}

extension DummyService {
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

private func endpoint(for service: DummyService) -> Endpoint {
  switch service {
  case .dummy(let request):
    return DummyEndpoint(request: request)
  }
}
