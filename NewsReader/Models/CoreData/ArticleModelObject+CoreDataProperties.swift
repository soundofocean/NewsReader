import Foundation
import CoreData

extension ArticleModelObject {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleModelObject> {
    let fetchRequest = NSFetchRequest<ArticleModelObject>(entityName: "ArticleModelObject")
    
    fetchRequest.sortDescriptors = []
    
    return fetchRequest
  }
  
  @NSManaged public var title: String?
}

extension ArticleModelObject: Identifiable {}
