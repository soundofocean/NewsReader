import SwiftUI

/// Экран избранных статей
struct FavoritesScreen: View {
  
  
  /// Подписчик - объект типа ViewModel, который следит за списком избранных статей ( = при изменении чего-либо в FavoritesViewModel вся информация автоматически передается в данный параметр и меняется view
  @ObservedObject var favoritesViewModel = FavoritesViewModel()
  
  /// Подписчик ( объект наблюдения) - объект типа ViewModel, который следит за списком статей
  @ObservedObject var articlesViewModel = ArticlesViewModel()
  
  var body: some View {
    
    NavigationView {
      
      //Список из текстовых view, которые представляют собой заголовки избранных статей
      List(favoritesViewModel.articles) { article in
        NavigationLink(destination: FavoriteArticleScreen(article: article )) {
          
          HStack {
            Text(article.title ?? "No title")
          }
        }
        .navigationTitle(Text("One of your favorites articles"))
      }
    }
  }
}
