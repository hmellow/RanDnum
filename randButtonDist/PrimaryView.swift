import SwiftUI
import UIKit


struct PrimaryView: View {
    @State private var isPresentingEditView = false
    @State private var currentNum = 0
    @State private var currentIcon = "equal.square.fill"
    @State private var randomNum = 0
    @State private var currentShape = Shape.circle;
    
    var body: some View {
        VStack {
            Text("The Number:")
                .font(.largeTitle)
            HStack {
                Text("\(currentNum)")
                    .font(.system(size: 95))
                    .fontWeight(.medium)
                .padding()
                Label("Indicator", systemImage: "\(currentIcon)")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.black)
            }
            Spacer()

            Button(action: {
                randomNum = Int(arc4random_uniform(3))
                switch randomNum {
                case 0:
                    currentNum = currentNum + 1
                    currentIcon = "plus.square.fill"
                case 1:
                    currentNum = currentNum - 1
                    currentIcon = "minus.square.fill"
                default:
                    currentIcon = "equal.square.fill"
                }
            }) {

                switch currentShape {
                case Shape.square:
                    Text("Push Here")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 250, alignment: .center)
                        .background(.blue)
                case Shape.roundedsquare:
                    Text("Push Here")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 250, alignment: .center)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                case Shape.capsule:
                    Text("Push Here")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 100, alignment: .center)
                        .background(.blue)
                        .clipShape(Capsule())
                case Shape.ellipse:
                    Text("Push Here")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 125, alignment: .center)
                        .background(.blue)
                        .clipShape(Ellipse())
                default:
                    Text("Push Here")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 250, alignment: .center)
                        .background(.blue)
                        .clipShape(Circle())
                }
            }
            Spacer()
        }
        .toolbar {
            Button("Options") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                EditView(shapeStatus: $currentShape)
                    .navigationTitle("Button Options")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Confirm") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
            .previewInterfaceOrientation(.portrait)
    }
}
