import Foundation

/// Модель статьи
struct Article: Codable, Hashable {  
  /// Заголовок
  var title: String?
  
  var author: String?
  
  var source: String?
  
  var url: String?
  
  var description: String?
  
  var image: String?
  
  var date: String?
}

