import SwiftUI

/// Экран со статьями
struct ArticlesScreen: View {
  
  // Наблюдаем за списком статей
  @ObservedObject var articlesViewModel = ArticlesViewModel()
  
  @State private var isShowingArticle = false
  
  @State var selectedArticleId: String?
  
  var body: some View {
    
    List(articlesViewModel.articles) { article in
      HStack {
        Text(article.title ?? "WRONG!")
      }
      .onTapGesture {
        self.selectedArticleId = article.id
        
        print(article.title ?? "Some title")
        
        print(article.id)               // Работает
        print(selectedArticleId as Any) // Работает
        
        self.isShowingArticle.toggle()
      }
    }
    .sheet(isPresented: $isShowingArticle) {
      Text(selectedArticleId ?? "Stub") // Не работает
    }
    
    // При появлении подгружается метод загрузки статей с сайта и описание различных ошибок
    .onAppear {
      articlesViewModel.loadingArticles()
    }
  }
}


