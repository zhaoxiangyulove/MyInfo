//
//  MyInfoView.swift
//  MyInfo
//
//  Created by zhaoxiangyu on 2021/5/7.
//
import SwiftUI

protocol BasicInfoItem {
  var name: String { get }
  var phone: String { get }
  var email: String { get }
  var avatar: UIImage { get}
}

protocol GraduationInfoItem {
  var description: String { get }
}

protocol SkillInfo {
  var description: String { get }
  var skills: [Skill] { get }
}

protocol MyInfoViewModel {
  var basicInfo: BasicInfoItem { get }
  var graduationInfo: GraduationInfoItem { get }
  var skillInfo: SkillInfo { get }
}


struct MyInfoView: View {
  // maybe DI better
  private let vm: MyInfoViewModel = MyInfoViewModelIMP()
  
  var body: some View {
    NavigationView {
      List {
        BasicInfoView(basicInfo: vm.basicInfo)
        GraduationInfoView(graduationInfo: vm.graduationInfo)
        SkillInfoView(skillInfo: vm.skillInfo)
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
        VStack(alignment: .leading, spacing: nil, content: {
          InfoLabel(text: "姓名: " + _basicInfo.name)
          InfoLabel(text: "电话: " + _basicInfo.phone)
          InfoLabel(text: "邮箱: " + _basicInfo.email)
        })
      }
    }
  }
  
  struct SectionView<Content>: View where Content: View {
    private let _title: String
    private let _content: Content
    
    init(title: String, content: () -> Content) {
      _title = title
      _content = content()
    }
    var body: some View {
      VStack(alignment: .leading, spacing: nil, content: {
        TitleLabel(text: _title)
        _content
      })
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
    private let _skillInfo: SkillInfo
    init(skillInfo: SkillInfo) {
      _skillInfo = skillInfo
    }
    
    var body: some View {
      SectionView(title: "相关技能") {
        VStack(alignment: .leading, spacing: nil, content: {
          InfoLabel(text: _skillInfo.description)
          ForEach(_skillInfo.skills) { (skill)  in
            InfoLabel(text: "")
          }
        })
      }
    }
  }
  
  struct AvatarView: View {
    private let _avatar: UIImage
    init(avatar: UIImage) {
      _avatar = avatar
    }
    
    var body: some View {
      Image(uiImage: _avatar)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 64.0, height: 64.0)
        .cornerRadius(32)
    }
  }
  
  struct InfoLabel: View {
    private let _text: String
    init(text: String) {
      _text = text
    }
    
    var body: some View  {
      Text(_text)
        .font(.body)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2
                            , trailing: 0))
    }
  }
  
  struct TitleLabel: View {
    private let _text: String
    init(text: String) {
      _text = text
    }
    
    var body: some View  {
      Text(_text)
        .font(.caption)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2
                            , trailing: 0))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MyInfoView()
  }
}
