import Foundation


enum Shape: String, CaseIterable, Identifiable  {
    case circle
    case square
    case roundedrectangle
    case capsule
    case ellipse
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
