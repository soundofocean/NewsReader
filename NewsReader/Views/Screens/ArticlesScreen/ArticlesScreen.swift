import SwiftUI

/// Экран со статьями
struct ArticlesScreen: View {
  
  /// Подписчик ( объект наблюдения) - объект типа ViewModel, который следит за списком статей
  @ObservedObject var articlesViewModel = ArticlesViewModel()
  
  var body: some View {
    
    NavigationView {
      
      //Список статей
      List(articlesViewModel.articles) { article in
        
        //Навигация, позволяющая открыть новый экран отдельной выбранной статьи
        NavigationLink(destination: ArticleScreen(article: article)) {
          
          //Текстовый view в виде заголовка
          HStack {
            Text(article.title ?? "WRONG!")
          }
        }
        
        //Название экрана
        .navigationTitle(Text("News"))
      }
    }
    
    // При появлении подгружается метод загрузки статей с сайта и описание различных ошибок
    .onAppear {
      articlesViewModel.loadingArticles()
    }
  }
}
