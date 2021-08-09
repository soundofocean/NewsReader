import SwiftUI

struct ArticleScreen: View {
  
  var article: Article
  
  @ObservedObject var favoritesViewModel = FavoritesViewModel()
  
  var body: some View {
    VStack {
      Text(article.description ?? "No description")
        .padding()
      
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
