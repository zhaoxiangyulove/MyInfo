//
//  Common.swift
//  MyInfo
//
//  Created by zhaoxiangyu on 2021/5/7.
//

import Foundation
import UIKit

// 这里写的是有问题的
let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy.MM"
  return formatter
}()

func getTime(startDate: Date, endDate: Date?) -> String {
  var now: String = "至今"
  if let date = endDate {
    now = dateFormatter.string(from: date)
  }
  return "\(dateFormatter.string(from: startDate)) - \(now)"
}

func getString(_ languages: [Language]) -> String {
  languages.map {
    $0.rawValue
  }.joined(separator: ", ")
}

func getString(_ designList: [Nameable], separator: String) -> String {
  designList.map {
    $0.name
  }.joined(separator: separator)
}

extension String {
  func zxy_getDate() -> Date {
    guard let date = dateFormatter.date(from: self) else {
      fatalError("There was an error decoding the string")
    }
    return date
  }
}

enum Device {
  //MARK:当前设备类型 iphone iPad Mac
  enum Devicetype {
    case iphone, ipad, mac
  }
  
  static var deviceType: Devicetype{
    #if os(macOS)
    return .mac
    #else
    if  UIDevice.current.userInterfaceIdiom == .pad {
      return .ipad
    }
    else {
      return .iphone
    }
    #endif
  }
  
  static var isPhone: Bool {
    return deviceType == .iphone
  }
}
