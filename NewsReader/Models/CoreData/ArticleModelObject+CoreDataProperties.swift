import Foundation
import CoreData

extension ArticleModelObject {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleModelObject> {
    return NSFetchRequest<ArticleModelObject>(entityName: "ArticleModelObject")
  }
  
  @NSManaged public var title: String?
}

extension ArticleModelObject: Identifiable {}
