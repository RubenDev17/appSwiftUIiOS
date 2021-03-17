 import SwiftUI
 //Clase para el mainmenu
 struct Navigator: View {
    var body: some View{
        //Creamos un menu de navegacion
        TabView{
            //En la primera parte aparecera el formulario
            ContentView()
                .tabItem {
                    Image(systemName: "pencil.and.ellipsis.rectangle")
                    Text("Datos")
                }
            //En la segunda parte aparecera la tarjeta
            CardView()
                .tabItem {
                    Image(systemName: "person.crop.rectangle")
                    Text("Tarjeta")
                }
        }
    }
 }
 
 struct NavigatorView_Previews: PreviewProvider{
    static var previews: some View{
        Navigator()
    }
 }
