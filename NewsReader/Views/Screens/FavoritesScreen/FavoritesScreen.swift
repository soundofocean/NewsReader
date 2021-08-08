import SwiftUI

struct FavoritesScreen: View {
  
  @ObservedObject var favoritesViewModel = FavoritesViewModel()
  
  var body: some View {
    Text("Favorites Screen")
  }
}
