import Combine
import SwiftUI

class FavoritesViewModel: ObservableObject {
  
  
  @Published var articles: [Article] = []
  
  
  func loadingArticles() {}
  
  private let cancellable: AnyCancellable?
  
  init(articlePublisher: AnyPublisher<[Article], Never> = ArticleStorage.shared.articles.eraseToAnyPublisher()) {
    cancellable = articlePublisher.sink { articles in
      print("Updating articles")
      self.articles = articles
    }
  }
}
