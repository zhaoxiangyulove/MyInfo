//
//  MyInfoViewModel.swift
//  MyInfo
//
//  Created by zhaoxiangyu on 2021/5/7.
//

import Foundation
import UIKit

struct SkillInfoItem: SkillInfo {
  var description: String
  var skills: [Skill]
}

final class MyInfoViewModelIMP {
  private let myInfo = MyInfo()
  private lazy var _skillInfo = {
    SkillInfoItem(description: """
      从 Objective-C 到 SwiftUI, 从 MVC + Singleton + KVO 到 MVVM + DI + Rx, 参考优秀的架构, 提高代码水平。
      参与 Flutter 开发, 快速上手新技术, 保证需求按时上线。
      学习 fastlane + jenkins 自动打包技术, 维护打包工作。
    """, skills: myInfo.programLanguageList)
  }()
  
}

extension MyInfoViewModelIMP: MyInfoViewModel {
  var skillInfo: SkillInfo {
    _skillInfo
  }
  
  var graduationInfo: GraduationInfoItem {
    myInfo.graduationInfo
  }
  
  var programLanguageList: [Skill] {
    myInfo.programLanguageList
  }
  
  var basicInfo: BasicInfoItem {
    myInfo.basicInfo
  }
}
extension GraduationInfo: GraduationInfoItem {
  var description: String {
    "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate)): \(school) \(profession) \(level.rawValue)"
  }
}

extension BasicInfo: BasicInfoItem {
  var avatar: UIImage {
    UIImage(named: "avatar")!
  }
}
