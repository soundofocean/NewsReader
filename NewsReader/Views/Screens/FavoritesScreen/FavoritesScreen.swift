import SwiftUI

struct FavoritesScreen: View {
  
  @ObservedObject var favoritesViewModel = FavoritesViewModel()
  
  var body: some View {
    List(favoritesViewModel.articles) { article in
      Text(article.title ?? "No title")
    }
  }
}
