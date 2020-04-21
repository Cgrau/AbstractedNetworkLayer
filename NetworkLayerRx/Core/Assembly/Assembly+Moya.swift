import Moya

extension Assembly {
  func moya<T: TargetType>() -> MoyaProvider<T> {
    let plugins = [PluginType]()
    return moyaNetworkProvider(plugins: plugins)
  }
  
  public func moyaNetworkProvider<Service: TargetType>(
    plugins: [PluginType] = []) -> MoyaProvider<Service> {
    return MoyaProvider(
      plugins: plugins
    )
  }
}
