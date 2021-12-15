import SwiftUI

struct TabBar: View {
    
    @State var color : Color = .blue
    
    @EnvironmentObject var navigator : Navigator
    
    var body: some View {
        HStack{
            
            Spacer()
            
            Button(action: {
                color = .blue
                withAnimation(.easeInOut(duration: 0.2)) {
                    
                navigator.isSearchPageOpen = true
                navigator.isReciepOpen = false
                navigator.isReciepeListOpen = false
                    
                }
                
            }, label: {
                VStack {
                    Image(systemName: "magnifyingglass")
                    
                    Text("Search")
                }
            })
            
            Spacer()
          
            Button(action: {
//                color = .yellow
                
                withAnimation(.easeInOut(duration: 0.2)) {
                    
                navigator.isSearchPageOpen = false
                navigator.isReciepOpen = false
                navigator.isReciepeListOpen = true
                    
                }
                
            }, label: {
                VStack {
                    Image(systemName: "mail.stack")
                    
                    Text("Recipes")
                }
            })
            
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    
//                    color = .green
                    navigator.isSearchPageOpen = false
                    navigator.isReciepOpen = true
                    navigator.isReciepeListOpen = false
                    
                }
                
            }, label: {
                VStack {
                    Image(systemName: "newspaper")
                    Text("Current")
                }
            })
            Spacer()
        }
        .foregroundColor(color)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
