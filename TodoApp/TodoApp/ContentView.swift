

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var session: Session
    var body: some View {
        if session.token == "" {
            AuthView()
        } else {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Session())
    }
}
