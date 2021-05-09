import SwiftUI

extension MyInfoView {
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
  
  struct TimeLabel: View {
    private let _text: String
    init(text: String) {
      _text = text
    }
    
    var body: some View  {
      Text(_text)
        .font(.headline)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 1
                            , trailing: 0))
    }
  }
  
  struct DisclosureInfoView: View {
    private let _content: String
    private let _subtitle: String
    private let _title: String
    init(title: String, subtitle: String, content: String) {
      _content = content
      _title = title
      _subtitle = subtitle
    }
    
    var body: some View {
      ZXYVStack {
        TimeLabel(text: _title)
        DisclosureGroup(
          content: {
            InfoLabel(text: _content)
              .padding(EdgeInsets(top: 0, leading: 2, bottom: 2, trailing: 2))
              .fixedSize(horizontal: false, vertical: true)
          },
          label: {
            InfoLabel(text: _subtitle)
          }
        )
        .accentColor(.black)
        Spacer(minLength: 3)
      }
      .animation(.none)
    }
  }
  
  struct ZXYVStack<Content> : View where Content : View {
    private let _content: Content
    init(@ViewBuilder content: () -> Content) {
      _content = content()
    }
    var body: some View {
      VStack(alignment: .leading, spacing: nil, content: {
        _content
      })
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
  
  struct WorkInfoView: View{
    private let _experience: WorkExperience
    init(experience: WorkExperience) {
      _experience = experience
    }
    
    var body: some View {
      DisclosureInfoView(title: getTime(startDate: _experience.startDate, endDate: _experience.endDate), subtitle: _experience.companyName, content: _experience.description)
    }
  }
}
