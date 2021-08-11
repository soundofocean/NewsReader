import SwiftUI

/// Экран выбранной статьи
struct ArticleScreen: View {
  
  var article: Article
  
  /// Подписчика - объект типа ViewModel, который следит за списком избранных статей.
  @ObservedObject var favoritesViewModel = FavoritesViewModel()
  
  var body: some View {
    VStack {
      
      // Текстовый  view в виде описания статьи
      Text(article.description ?? "No description")
        .padding()
      
      // Кнопка в виде звездочки, которая позволяет добавлять статью в хранилище статей
      Button {
        
        favoritesViewModel.add(article: article)
        
      } label: {
        Image(systemName: "star")
          .resizable()
          .renderingMode(.template)
          .font(.system(size: 10, weight: .heavy, design: .default))
          .frame(width: 100, height: 100, alignment: .center)
      }
      
    }
    .navigationTitle(Text("By " + (article.author ?? "No author")))
  }
}
