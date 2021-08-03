import Foundation

/// Модель статьи
struct Article: Codable, Identifiable {
  
  var id: String = UUID().uuidString
  
  var title: String?
  
  var author: String?
  
  var source: String?
  
  var url: String?
  
  var description: String?
  
  var image: String?
  
  var date: String?
  
  enum CodingKeys: CodingKey {
    case title
    case author
    case source
    case url
    case description
    case image
    case date
  }
}

