//
//  MyInfo.swift
//  MyInfo
//
//  Created by zhaoxiangyu on 2021/5/7.
//

import Foundation

struct MyInfo {
  let basicInfo = BasicInfo()
  let graduationInfo = GraduationInfo()
  let programLanguageList = [
    Skill(language: .swift, useYears: 1.5, proficiency: .proficient),
    Skill(language: .oc, useYears: 3.0, proficiency: .skilled),
    Skill(language: .dart, useYears: 0.5, proficiency: .understand)
  ]
  let projectExperienceList: [ProjectExperience]
  let workExperienceList: [WorkExperience]
  
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
}
