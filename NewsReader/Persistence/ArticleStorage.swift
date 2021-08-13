import Combine
import CoreData
import Foundation

/// Класс, который хранит в себе все статьи и описывает запросы к БД
class ArticleStorage: NSObject, ObservableObject {
  
  // #warning - что такое CurrentValueSubject
  // Издатель, содержащего массив моделек Article
  var articles = CurrentValueSubject<[ArticleModelObject], Never>([])
  
  // #warning! что это за константа?
  /// Контроллер управления результатами запроса Core Data и для отображения данных пользователю.
  private let articlesFetchController: NSFetchedResultsController<ArticleModelObject>
  
  /// Объект в единственном экземпляре на все приложение
  static let shared: ArticleStorage = ArticleStorage()
  
  //#warning - что значит оverride? В целом не понимаю, как работает конструктор
  private override init() {
    articlesFetchController = NSFetchedResultsController(
      fetchRequest: ArticleModelObject.fetchRequest(),
      managedObjectContext: PersistenceController.shared.container.viewContext,
      sectionNameKeyPath: nil, cacheName: nil
    )
    
    //#warning  что значит super
    super.init()
    
    articlesFetchController.delegate = self
    
    do {
      
      //  Попытка выполнения запроса и сохранение результата в articles или пустого массива в случае ошибки
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
    /// Объект запроса
    let fetchArticleRequest = ArticleModelObject.fetchArticleRequest(id: id)
    
    //    let deleteArticleRequest = NSBatchDeleteRequest(fetchRequest: fetchArticleRequest)
    
    do {
      let article = try PersistenceController.shared.container.viewContext.execute(fetchArticleRequest)
      
      PersistenceController.shared.container.viewContext.delete(article.)
    } catch {
      print(String(describing: error))
    }
  }
}

//#warning! - что это вообще за расширение?
// При изменении в контенте динамически обновляются статьи
extension ArticleStorage: NSFetchedResultsControllerDelegate {
  public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    guard let articles = controller.fetchedObjects as? [ArticleModelObject] else { return }
    print("Context has changed, relouding articles")
    self.articles.value = articles
  }
}
