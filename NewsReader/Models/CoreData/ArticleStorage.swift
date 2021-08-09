import Combine
import CoreData
import Foundation

/// Класс, который описывает запросы к БД
class ArticleStorage: NSObject, ObservableObject {
  
  //  Создание издателя, содержащего массив моделек Article - информацию об изменении массива получают все, кто на него подписан
  var articles = CurrentValueSubject<[ArticleModelObject], Never>([])
  
  private let articlesFetchController: NSFetchedResultsController<ArticleModelObject>
  
  /// Объект в единственном экземпляре на все приложение
  static let shared: ArticleStorage = ArticleStorage()
  
  private override init() {
    articlesFetchController = NSFetchedResultsController(
      fetchRequest: ArticleModelObject.fetchRequest(),
      managedObjectContext: PersistenceController.shared.container.viewContext,
      sectionNameKeyPath: nil, cacheName: nil
    )
    
    super.init()
    
    articlesFetchController.delegate = self
    
    do {
      
      //      Попытка выполнения зароса и сохранение результата в articles или пустого массива в случае ошибки
      try articlesFetchController.performFetch()
      articles.value = articlesFetchController.fetchedObjects ?? []
    } catch {
      NSLog("Error: couldn't fetch request")
    }
  }
  
  /// Метод добавления новой записи
  /// - Parameter article: объект
  func add(article: Article) {
    do {
      
      /// Новая запись о статье в БД
      let newCoreDataArticle = ArticleModelObject(context: PersistenceController.shared.container.viewContext)
      
//      Связка
      newCoreDataArticle.title = article.title
      
//      Попытка сохранения в контейнер
      try newCoreDataArticle.managedObjectContext?.save()
      
    } catch {
      print(error)
    }
  }
  
  func delete(id: UUID) {
    
  }
}

// При изменении в контенте динамически обновляются статьи
extension ArticleStorage: NSFetchedResultsControllerDelegate {
  public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    guard let articles = controller.fetchedObjects as? [ArticleModelObject] else { return }
    print("Context has changed, relouding articles")
    self.articles.value = articles
  }
}
