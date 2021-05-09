//
//  Info.swift
//  MyInfo
//
//  Created by zhaoxiangyu on 2021/5/7.
//

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

struct Skill: Identifiable {
  let id = UUID()
  let language: Language
  let useYears: Float
  let proficiency: Proficiency
}

struct ProjectExperience: Identifiable {
  let id = UUID()
  let startDate: Date
  let endDate: Date?
  let projectName: String
  let role: Role
  let programLanguages: [Language]
  let designPatterns: [Design]
  let description: String
  let mainTechniques: [Technique]
}

struct WorkExperience: Identifiable {
  let id = UUID()
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
