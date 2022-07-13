import SwiftUI

struct EditView: View {
    @Binding var shapeStatus: Shape
    
    var body: some View {
        Form {
            Section(header: Text("Button Options")) {
                Picker("Shape", selection: $shapeStatus) {
                    ForEach(Shape.allCases) { shape in
                        Text(shape.rawValue.capitalized).tag(shape)
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(shapeStatus: .constant(Shape.circle))
    }
}
