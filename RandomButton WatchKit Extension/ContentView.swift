import SwiftUI

struct ContentView: View {
    @State private var currentNum = 0
    @State private var currentIcon = "equal.square.fill"
    @State private var randomNum = 0

    
    var body: some View {
        VStack {
            Text("The Number:")
                .font(.system(size: 20))
                .fontWeight(.bold)
            HStack {
                Text("\(currentNum)")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                .padding()
                Label("Indicator", systemImage: "\(currentIcon)")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.white)
            }
            Spacer()
                .padding(.bottom)
            
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
                Text("Push Here")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(width: 160, height: 85, alignment: .center)
                    .background(.blue)
                    .clipShape(Capsule())

            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
