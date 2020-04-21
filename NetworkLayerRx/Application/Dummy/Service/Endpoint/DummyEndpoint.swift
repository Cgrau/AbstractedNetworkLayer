import Moya
import Alamofire

struct DummyEndpoint: Endpoint {
  
  private let request: DummyRequest
  
  init(request: DummyRequest) {
    self.request = request
  }
  
  var path: String {
    return "/dummy/service"
  }
  
  var method: Moya.Method {
    return .post
  }
  
  func parameters() -> [String: Any]? {
    return parametersSignup()
  }
  
  var task: Task {
    return .requestParameters(
      parameters: parametersSignup(),
      encoding: JSONEncoding.default)
  }
  
  func parametersSignup() -> [String: Any] {
    let requestParameters: [String: Any] = ["first_name": request.firstName,
                                            "last_name": request.lastName]
    return requestParameters
  }
}
