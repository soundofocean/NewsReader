import SwiftUI

/// Экран с одной открытой статьей из спика избранных
struct FavoriteArticleScreen: View {
  var article: Article
  
  /// Подписчика - объект типа ViewModel, который следит за списком избранных статей.
  @ObservedObject var favoritesViewModel = FavoritesViewModel()
  
  var body: some View {
    
    // Текстовый  view в виде описания статьи
    Text(article.description ?? "No description")
      .padding()
      .navigationTitle(Text("By " + (article.author ?? "No author")))
  }
}


