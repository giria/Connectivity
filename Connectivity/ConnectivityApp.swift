

import SwiftUI

@main
struct ConnectivityApp: App {
    @State private var networkStatus = NetworkStatus()
  
    
    init() {
        networkStatus.start()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ConnectivityView()
               .environment(networkStatus)
               
             
        }
    }
}
