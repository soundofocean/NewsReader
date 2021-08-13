import Foundation
import CoreData

extension ArticleModelObject {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleModelObject> {
    let fetchRequest = NSFetchRequest<ArticleModelObject>(entityName: "ArticleModelObject")
    
    fetchRequest.sortDescriptors = []
    
    return fetchRequest
  }
  
  @nonobjc public class func fetchArticleRequest(id: UUID) -> NSFetchRequest<ArticleModelObject> {
    let fetchArticleRequest = NSFetchRequest<ArticleModelObject>(entityName: "ArticleModelObject")
   
    fetchArticleRequest.predicate = NSPredicate(format: "identifier == %@", id as CVarArg)
    
    fetchArticleRequest.fetchLimit = 1
    
    return fetchArticleRequest
  }
  
  @NSManaged public var title: String?
  @NSManaged public var author: String?
  @NSManaged public var date: String?
  @NSManaged public var id: UUID
}

extension ArticleModelObject: Identifiable {}
