import SwiftUI

/// Экран с одной открытой статьей из спика избранных
struct FavoriteArticleScreen: View {
  
  var article: ArticleModelObject
  
  /// Подписчика - объект типа ViewModel, который следит за списком избранных статей.
  @ObservedObject var favoritesViewModel = FavoritesViewModel()
  
  /// Подписчик ( объект наблюдения) - объект типа ViewModel, который следит за списком статей
  @ObservedObject var articlesViewModel = ArticlesViewModel()
  
  var body: some View {
    
    // Текстовый  view в виде описания статьи
    Text(article.title ?? "No title")
      .padding()
      .navigationTitle(Text("By " + (article.title ?? "No title")))
  }
}


