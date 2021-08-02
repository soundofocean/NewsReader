import SwiftUI

/// Экран со статьями
struct ArticlesScreen: View {
  
  //  Наблюдаем за списком статей
  @ObservedObject var articlesViewModel = ArticlesViewModel()
  
  @State private var isShowingArticle = false
  
  var body: some View {
    
    //    Перечисление заголовков статей
    List(articlesViewModel.articles, id: \.self) { article in
      Text(article.title ?? "WRONG!")
        .onTapGesture {
          self.isShowingArticle.toggle()
        }
    }
    .sheet(isPresented: $isShowingArticle) {ArticleScreen(article: articlesViewModel.articles[6] )}
  
    //    При появлении подгружается метод загрузки статей с сайта и описание различных ошибок
    .onAppear {
      articlesViewModel.loadingArticles()
    }
  }
}


