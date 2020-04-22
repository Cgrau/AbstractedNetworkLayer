import Moya
import Alamofire

struct StopEndpoint: Endpoint {
  var path: String {
    return "/stops/1"
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Task {
    return .requestPlain
  }
}
