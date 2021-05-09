import UIKit

protocol BasicInfoItem {
  var name: String { get }
  var phone: String { get }
  var email: String { get }
  var avatar: UIImage { get }
}

protocol GraduationInfoItem {
  var description: String { get }
}

protocol SkillInfoItem {
  var description: String { get }
  var skills: [Skill] { get }
}

protocol ProjectInfoItem {
  var projectExperienceList: [ProjectExperience] { get }
}

protocol WorkInfoItem {
  var workExperienceList: [WorkExperience] { get }
}

protocol MyInfoViewModel {
  var basicInfo: BasicInfoItem { get }
  var graduationInfo: GraduationInfoItem { get }
  var skillInfo: SkillInfoItem { get }
  var projectInfo: ProjectInfoItem { get }
  var workInfo: WorkInfoItem { get }
  var summary: String { get }
}
