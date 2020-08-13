protocol ErrorAdaptable {
  var errorAdapter: ErrorAdapter { get }
}

extension Assembly: ErrorAdaptable {
  var errorAdapter: ErrorAdapter {
    return DefaultErrorAdapter(configuration: errorConfiguration)
  }
}
