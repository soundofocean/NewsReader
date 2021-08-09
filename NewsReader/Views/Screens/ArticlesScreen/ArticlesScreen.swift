import SwiftUI

/// Экран со статьями
struct ArticlesScreen: View {
  
  // Наблюдаем за списком статей
  @ObservedObject var articlesViewModel = ArticlesViewModel()
  
  var body: some View {
    
    NavigationView {
      List(articlesViewModel.articles) { article in
        NavigationLink(destination: ArticleScreen(article: article)) {
          HStack {
            Text(article.title ?? "WRONG!")
          }
        }
        .navigationTitle(Text("News"))
      }
    }
    
    // При появлении подгружается метод загрузки статей с сайта и описание различных ошибок
    .onAppear {
      articlesViewModel.loadingArticles()
    }
  }
}



var some: (String) -> Void = { hvl in
  print(hvl)
}
