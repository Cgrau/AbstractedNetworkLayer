//
//  String+TimeStampDate.swift
//  NetworkLayerRx
//
//  Created by Carles Grau on 21/04/2020.
//  Copyright © 2020 Carles Grau. All rights reserved.
//

import Foundation

extension String {
  func parseDuration(_ timeString: String) -> TimeInterval {
      guard !timeString.isEmpty else {
          return 0
      }

      var interval:Double = 0

      let parts = timeString.components(separatedBy: ":")
      for (index, part) in parts.reversed().enumerated() {
          interval += (Double(part) ?? 0) * pow(Double(60), Double(index))
      }

      return interval
  }
  
  func mapToDate() -> String? {
    let time = parseDuration(self)
    let date = Date(timeIntervalSince1970: time)
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    return dateFormatter.string(from: date)
  }
}
