import Combine
import SwiftUI

class FavoritesViewModel: ObservableObject {
  
  @Published var articles: [ArticleModelObject] = []
  
  /// Мешок с подписками
  private var cancellable: AnyCancellable?

  // Обращение к хранилищу ArticleStorage, имеющее доступ к БД через shared.eraseToAnyPublisher стирает тип издателя у articles и превращает в AnyPublusher по требованию articlePublisher
  init(
    articlePublisher: AnyPublisher<[ArticleModelObject], Never> =
      ArticleStorage.shared.articles.eraseToAnyPublisher()
  ) {

    // Сохранение в мешок подписок. Метод sink - создание подписчика
    cancellable = articlePublisher.sink { articles in
      print("Updating articles")
      self.articles = articles
    }
  }
  
  func add(article: Article) {
    ArticleStorage.shared.add(article: article)
  }
}
