import SwiftUI

struct ContentView: View {
    @StateObject var user = User(name: "Mike")

    var body: some View {
        VStack {
            Text("\(user.name)")
            Text("\(user.status.update)")

            Button(action: {
                user.status.update += 1
                user.objectWillChange.send()
            }, label: {
                Text("Update")
            })
        }
        .padding()
    }
}

class User: ObservableObject {
    @Published var name: String
    @Published var status = Status()

    init(name: String) {
        self.name = name
    }
}

class Status: ObservableObject {
    @Published var update = 0
}

#Preview {
    ContentView()
}
