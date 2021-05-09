//
//  MyInfoView.swift
//  MyInfo
//
//  Created by zhaoxiangyu on 2021/5/7.
//
import SwiftUI

struct MyInfoView: View {
  // maybe DI better
  private let vm: MyInfoViewModel = MyInfoViewModelIMP()
  
  var body: some View {
    NavigationView {
      List {
        BasicInfoView(basicInfo: vm.basicInfo)
        GraduationInfoView(graduationInfo: vm.graduationInfo)
        SkillInfoView(skillInfo: vm.skillInfo)
        ProjectInfoList(projectInfo: vm.projectInfo)
        WorkInfoList(workInfo: vm.workInfo)
        SummaryView(description: vm.summary)
      }
      .navigationBarTitle("个人简历")
    }
  }
  
  struct BasicInfoView: View {
    private let _basicInfo: BasicInfoItem
    init(basicInfo: BasicInfoItem) {
      _basicInfo = basicInfo
    }
    
    var body: some View {
      HStack {
        AvatarView(avatar: _basicInfo.avatar)
          .padding(.all)
        ZXYVStack {
          InfoLabel(text: "姓名: " + _basicInfo.name)
          InfoLabel(text: "电话: " + _basicInfo.phone)
          InfoLabel(text: "邮箱: " + _basicInfo.email)
        }
      }
    }
  }
  
  struct SectionView<Content>: View where Content: View {
    private let _title: String
    private let _content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
      _title = title
      _content = content()
    }
    var body: some View {
      ZXYVStack {
        TitleLabel(text: _title)
        _content
      }
    }
  }
  
  struct GraduationInfoView: View {
    private let _graduationInfo: GraduationInfoItem
    init(graduationInfo: GraduationInfoItem) {
      _graduationInfo = graduationInfo
    }
    
    var body: some View {
      SectionView(title: "教育背景") {
        InfoLabel(text: "  " + _graduationInfo.description)
      }
    }
  }
  
  struct SkillInfoView: View {
    private let _skillInfo: SkillInfoItem
    init(skillInfo: SkillInfoItem) {
      _skillInfo = skillInfo
    }
    
    var body: some View {
      SectionView(title: "相关技能") {
        ZXYVStack {
          InfoLabel(text: _skillInfo.description)
          ForEach(_skillInfo.skills) { (skill)  in
            InfoLabel(text: skill.language.rawValue + " | " + skill.proficiency.rawValue + " | " + "\(skill.useYears) " + "年")
          }
        }
      }
    }
  }
  
  struct ProjectInfoList: View {
    private let _item: ProjectInfoItem
    init(projectInfo: ProjectInfoItem) {
      _item = projectInfo
    }
    
    var body: some View {
      ZXYVStack {
        TitleLabel(text: "项目经验")
        ForEach(_item.projectExperienceList) { (experience) in
          ProjectInfoView(experience: experience)
        }
      }
    }
  }
  
  struct WorkInfoList: View {
    private let _item: WorkInfoItem
    init(workInfo: WorkInfoItem) {
      _item = workInfo
    }
    
    var body: some View {
      ZXYVStack {
        TitleLabel(text: "工作经历")
        ForEach(_item.workExperienceList) { (experience) in
          WorkInfoView(experience: experience)
        }
      }
    }
  }
  
  struct ProjectInfoView: View{
    private let _experience: ProjectExperience
    init(experience: ProjectExperience) {
      _experience = experience
    }
    
    var body: some View {
      DisclosureInfoView(title: getTime(startDate: _experience.startDate, endDate: _experience.endDate), subtitle: _experience.projectName + " - " + _experience.description, content: "开发语言：\(getString(_experience.programLanguages))\n设计模式：\(getString(_experience.designPatterns, separator: ", "))\n主要技术：\(getString(_experience.mainTechniques, separator: "\n"))")
    }
  }
  
  struct WorkInfoView: View{
    private let _experience: WorkExperience
    init(experience: WorkExperience) {
      _experience = experience
    }
    
    var body: some View {
      DisclosureInfoView(title: getTime(startDate: _experience.startDate, endDate: _experience.endDate), subtitle: _experience.companyName, content: _experience.description)
    }
  }
  
  struct SummaryView: View {
    private let _description: String
    init(description: String) {
      _description = description
    }
    
    var body: some View {
      ZXYVStack {
        TitleLabel(text: "总结")
        InfoLabel(text: _description)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MyInfoView()
  }
}
