//
//  MyInfoViewModel.swift
//  MyInfo
//
//  Created by zhaoxiangyu on 2021/5/7.
//

import Foundation
import UIKit

struct SkillInfoItemIMP: SkillInfoItem {
  var description: String
  var skills: [Skill]
}

final class MyInfoViewModelIMP {
  private let myInfo = MyInfo()
  private lazy var _skillInfo = {
    SkillInfoItemIMP(description: """
      从 Objective-C 到 SwiftUI, 从 MVC + Singleton + KVO 到 MVVM + DI + Rx, 参考优秀的架构, 提高代码水平。
      参与组件化和热插拔开发工作，利用 DI 和 Protocol 进行组件解耦，基于 CocoaPods 进行动态加载组件库。
      学习 fastlane + jenkins 自动打包技术, 维护打包工作。
    """, skills: myInfo.programLanguageList)
  }()
  
}

extension MyInfoViewModelIMP: MyInfoViewModel {
  var summary: String {
    "五年 iOS 开发经验, 擅长组件化开发, 跨平台开发, 追求极致的用户体验。"
  }
  
  var workInfo: WorkInfoItem {
    myInfo
  }
  
  var projectInfo: ProjectInfoItem {
    myInfo
  }
  
  var skillInfo: SkillInfoItem {
    _skillInfo
  }
  
  var graduationInfo: GraduationInfoItem {
    myInfo.graduationInfo
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

extension MyInfo: ProjectInfoItem {
  
}

extension MyInfo: WorkInfoItem {

}
