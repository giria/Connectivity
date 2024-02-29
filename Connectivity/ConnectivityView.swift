


import SwiftUI

struct ConnectivityView: View {
    @Environment(NetworkStatus.self) private var networkStatus
    
    
    
    var body: some View {
        ZStack{
           
            
            VStack(spacing: 16) {
                itemView(title: "WiFi", image: "wifi", type: .wifi)
                
                itemView(title: "Cellular", image: "antenna.radiowaves.left.and.right", type: .cellular)
                
                itemView(title: "Localhost", image: "house", type: .localhost)
                
                itemView(title: "Ethernet", image: "app.connected.to.app.below.fill", type: .ethernet)
                
                itemView(title: "No Connection", image: "xmark.octagon", type: .unknown)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           //.background(.tertiary)
            
        }
    }
    
    @ViewBuilder
    func itemView(title: String, image: String, type: NetworkStatus.InterfaceType) -> some View {
        let isSelected = (networkStatus.interfaceType == type)
        HStack {
            Image(systemName: image)
                .font(.title2.weight(.bold))
                .foregroundColor(isSelected ? .accentColor : .gray)
            
            Text(title)
                .font(.title2.weight(.bold))
                .foregroundColor(isSelected ? .accentColor : .gray)
        }
        .scaleEffect(isSelected ? 1.2 : 1)
        .animation(.default, value: isSelected)
    }
}




#Preview {
    ConnectivityView()
        .environment(NetworkStatus())
}

