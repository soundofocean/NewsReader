import SwiftUI

struct ArticleScreen: View {
  
  var article: Article
  
  var body: some View {
    Text(article.title ?? "No title")
  }
}
