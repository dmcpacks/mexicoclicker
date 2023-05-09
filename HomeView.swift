import SwiftUI

/*#-code-walkthrough(HomeView.struct)*/
struct HomeView: View {
    /*#-code-walkthrough(HomeView.struct)*/
    /*#-code-walkthrough(HomeView.views)*/
    var body: some View {
        ZStack {
            
            Color.red
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Text("Acerca de mi")
                /*#-code-walkthrough(HomeView.modifiers)*/
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                /*#-code-walkthrough(HomeView.modifiers)*/
                /*#-code-walkthrough(HomeView.Image)*/
                Image("myphoto")
                /*#-code-walkthrough(HomeView.Image)*/
                /*#-code-walkthrough(HomeView.Image.resizable)*/
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                
                /*#-code-walkthrough(omeView.Image.overlay)*/
                /*#-code-walkthrough(HomeView.Text)*/
                Text("René Martínez Villaseñor")
                /*#-code-walkthrough(HomeView.Text)*/
                /*#-code-walkthrough(HomeView.Text.modifiers)*/
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                /*#-code-walkthrough(HomeView.Text.modifiers)*/
                /*#-code-walkthrough(HomeView.Text.moreModifiers)*/
                
                Spacer()
                
                Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                    Text("Colegio Ingles")
                        .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: Color.blue)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                /*#-code-walkthrough(HomeView.stacksOnStacks)*/
            }
            .padding()
        }
        /*#-code-walkthrough(HomeView.Image.background)*/
        
        /*#-code-walkthrough(HomeView.Image.background)*/
        /*#-code-walkthrough(HomeView.Image.clip)*/
        
        /*#-code-walkthrough(HomeView.Image.clip)*/
        
    }
    /*#-code-walkthrough(HomeView.views)*/
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
    struct FontNames {
        static var americanTypwriter = "American Typewriter"
        static var arial = "Arial"
        static var baskerville = "Baskerville"
        static var chalkduster = "Chalkduster"
        static var courier = "Courier"
        static var georgia = "Georgia"
        static var helvetica = "Helvetica"
        static var palatino = "Palatino"
        static var zapfino = "Zapfino"
    }
}
