import Combine
import SwiftUI

/// Наблюдаемый объект, в котором описываются все возможные действия, которые могут происходить в FavoritesScreen
class FavoritesViewModel: ObservableObject {
  
  /// Изатель  типа пустого массива ArticleModelObject
  @Published var articles: [ArticleModelObject] = []
  
  /// Мешок с подписками
  private var cancellable: AnyCancellable?
  
  // Конструктор класса, в котором происходит обращение к хранилищу ArticleStorage, имеющего доступ к базе данных. С помощью shared.eraseToAnyPublisher происходит стирание типа издателя у articles и превращение в AnyPublisher по требованию articlePublisher. Использование static shared дает возможность без создания дополнительного объекта ArticleStorage, обращаться к нему
  init(
    articlePublisher: AnyPublisher<[ArticleModelObject], Never> =
      ArticleStorage.shared.articles.eraseToAnyPublisher()
  ) {
    
    // В параметр в виде мешка с подписками сохраняется результат работы конструктора и создание подписчика и его запись в переменную articles
    cancellable = articlePublisher.sink { articles in
      print("Updating articles")
      self.articles = articles
    }
  }
  
  
  //  #понять, где используется!
  /// Метод добавления статьи в хранилище статей
  /// - Parameter article: статья
  func add(article: Article) {
    ArticleStorage.shared.add(article: article)
  }
}
