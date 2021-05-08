import Foundation

struct BasicInfo {
  let name = "赵翔宇"
  let birthday = "1991.02".zxy_getDate()
  let phone = "18510865456"
  let email = "44899845@qq.com"
  let sex: Sex = .man
  
  func getDescription() -> String {
    "个人信息: \n 姓名：\(name) \n 性别：\(sex.rawValue) \n 出生年月：\(dateFormatter.string(from: birthday)) \n 电话：\(phone) \n 邮箱：\(email)"
  }
}

struct GraduationInfo {
  let school = "华北电力大学"
  let profession = "信息管理与信息系统"
  let startDate = "2009.06".zxy_getDate()
  let endDate = "2013.06".zxy_getDate()
  let level: Degree = .bachelor
  
  func getDescription() -> String {
    "教育背景: \n \(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate)): \(school) \(profession) \(level.rawValue)"
  }
}

struct Skill {
  let language: Language
  let useYears: Float
  let proficiency: Proficiency
}

struct ProjectExperience {
  let startDate: Date
  let endDate: Date?
  let projectName: String
  let role: Role
  let programLanguages: [Language]
  let designPatterns: [Design]
  let description: String
  let mainTechniques: [Technique]
}

struct WorkExperience {
  let startDate: Date
  let endDate: Date?
  let companyName: String
  let description: String
}

enum Degree: String {
  case bachelor = "学士学位"
}

enum Language: String {
  case swift = "Swift", oc = "Objective-C", dart = "Dart"
}

enum Proficiency: String {
  case proficient = "精通", skilled = "熟练", understand = "了解"
}

enum Sex: String {
  case man = "男", woman = "女"
}

enum Role: String {
  case maintainer = "维护者", developer = "开发者"
}

protocol Nameable {
  var name: String { get }
}

protocol Design: Nameable {
}

protocol Technique: Nameable {
}

extension String: Design, Technique {
  var name: String {
    self
  }
}

struct MyInfo {
  private let basicInfo = BasicInfo()
  private let graduationInfo = GraduationInfo()
  private let programLanguageList = [
    Skill(language: .swift, useYears: 1.5, proficiency: .proficient),
    Skill(language: .oc, useYears: 3.0, proficiency: .skilled),
    Skill(language: .dart, useYears: 0.5, proficiency: .understand)
  ]
  private let projectExperienceList: [ProjectExperience]
  private let workExperienceList: [WorkExperience]
  
  init() {
    projectExperienceList = [
      ProjectExperience(startDate: "2019.11".zxy_getDate(), endDate: nil, projectName: "Kim", role: .maintainer, programLanguages: [.swift, .dart], designPatterns: ["MVVM", "DI", "RxSwift"], description: "快手内部办公套件", mainTechniques: [
        "使用 MVVM + RxSwift 做响应式编程",
        "使用 DI 解决依赖反转问题, singleton 生命周期问题",
        "组件化开发, 解决代码耦合问题",
        "使用 Flutter 开发日历相关需求"
      ]),
      ProjectExperience(startDate: "2019.03".zxy_getDate(), endDate: "2019.10".zxy_getDate(), projectName: "Color Fun", role: .developer, programLanguages: [.oc], designPatterns: ["MVC", "Singleton", "RAC"], description: "基于 OpenGL 开发的涂色游戏", mainTechniques: [
        "集成 RAC 做响应式编程, 使用内置宏, 提高效率",
        "结构分层, 负责数据层开发, 保证各版本升级的稳定",
        "提供一键生成马甲包工具, 对海外的 Color Fun 进行一键生成国内包"
      ]),
      ProjectExperience(startDate: "2018.03".zxy_getDate(), endDate: "2019.03".zxy_getDate(), projectName: "GoldenEye", role: .developer, programLanguages: [.oc], designPatterns: ["Adapter", "Strategy"], description: "广告库 SDK", mainTechniques: [
        "Config 远端配置, 支持线上产品更改广告相关内容",
        "API 的统一, 加载和展示策略的多样和稳定, 使项目组代码更容易接入, 并提高收益",
        "负责为 H5 提供了 JS 版广告库, 主要语法为 ES6"
      ])
    ]
    workExperienceList = [
      WorkExperience(startDate: "2019.11".zxy_getDate(), endDate: nil, companyName: "达佳互联", description: " 负责 Kim 重构版本架构设计和消息模块开发.\n  负责登录组件化模块设计和开发.\n  负责打包发版和观察线上数据."),
      WorkExperience(startDate: "2018.03".zxy_getDate(), endDate: "2019.10".zxy_getDate(), companyName: "iHandy", description: " 负责项目组 Color Fun 产品研发, 负责广告、成就、订阅、主玩页面的相关功能开发和维护.\n 负责SDK 组广告相关开发, 包括新广告厂商的接入和封装，新的策略开发, 提供并指导项目组使用."),
      WorkExperience(startDate: "2017.07".zxy_getDate(), endDate: "2018.02".zxy_getDate(), companyName: "四维数创", description: " 负责阜阳市智慧社区平台项目开发, 包括平台应用开发, 和应用管理界面开发."),
      WorkExperience(startDate: "2016.04".zxy_getDate(), endDate: "2017.06".zxy_getDate(), companyName: "飞艾科技", description: " 负责 iOS 项目 Holo-在线试穿戴 的所有功能."),
      WorkExperience(startDate: "2013.06".zxy_getDate(), endDate: "2015.06".zxy_getDate(), companyName: "远光软件", description: " 编写需求文档，与产品经理配合，完成国网的各项目标")
    ]
  }
  
  func getInfoDescription() -> String {
    basicInfo.getDescription() + "\n" + graduationInfo.getDescription() + "\n" + getSkillsDescription() + "\n" + getProjectExperience() + "\n" + getworkExperience() + "\n" + getSummary()
  }
  
  private func getSkillsDescription() -> String {
    let skill = programLanguageList.map {
      " " + $0.language.rawValue + " | " + $0.proficiency.rawValue + " | " + "\($0.useYears) " + "年"
    }.joined(separator: "\n")
    return "相关技能 \n\(skill)\n\(getSkillSupplement())"
  }
  
  private func getSkillSupplement() -> String {
    """
     从 Objective-C 到 SwiftUI, 从 MVC + Singleton + KVO 到 MVVM + DI + Rx, 参考优秀的架构, 提高代码水平.
     参与 Flutter 开发, 快速上手新技术, 保证需求按时上线.
     学习 fastlane + jenkins 自动打包技术, 维护打包工作.
    """
  }
  
  private func getProjectExperience() -> String {
    let workExperience = projectExperienceList.map {
      var now: String = "至今"
      if let date = $0.endDate {
        now = dateFormatter.string(from: date)
      }
      return " \(dateFormatter.string(from: $0.startDate)) - \(now) | \($0.projectName) - \($0.description)\n  开发语言：\(getString($0.programLanguages))\n  设计模式：\(getString($0.designPatterns, separator: ", "))\n  主要技术：\(getString($0.mainTechniques, separator: "\n          "))"
    }.joined(separator: "\n")
    return "项目经验 \n\(workExperience)"
  }
  
  private func getString(_ languages: [Language]) -> String {
    languages.map {
      $0.rawValue
    }.joined(separator: ", ")
  }
  
  private func getString(_ designList: [Nameable], separator: String) -> String {
    designList.map {
      $0.name
    }.joined(separator: separator)
  }
  
  private func getworkExperience() -> String {
    let workExperience = workExperienceList.map {
      var now: String = "至今"
      if let date = $0.endDate {
        now = dateFormatter.string(from: date)
      }
      return " \(dateFormatter.string(from: $0.startDate)) - \(now) | \($0.companyName) \n 主要工作:\n \($0.description)"
    }.joined(separator: "\n")
    return "工作经历 \n\(workExperience)"
  }
  
  private func getSummary() -> String {
    """
    总结
     五年 iOS 开发经验, 用户体验和个人代码都在追求极致, 高效开发, OPEN, 有数据分析能力和较高的风控意识.
    """
  }
}

fileprivate let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy.MM"
  return formatter
}()

fileprivate extension String {
  func zxy_getDate() -> Date {
    guard let date = dateFormatter.date(from: self) else {
      fatalError("There was an error decoding the string")
    }
    return date
  }
}

let info = MyInfo()
print(info.getInfoDescription())

