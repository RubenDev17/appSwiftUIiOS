import SwiftUI

struct CardView: View {
    //Creamos una variable de tipo userInfo para poder compartir el dato del color de fuente
    @EnvironmentObject var userInfo: UserInfo
    //Creamos un gestor para la animación que nos muestre una cara de la tarjeta u otra
    @State var manager = true
    //Creamos una variable para el color de la tarjeta
    @State var color : Color = Color.red
    
    var body: some View {
        
        VStack{
            //Titular
            Text("Tu tarjeta")
                .font(.largeTitle)
            Spacer()
            //Paleta de colores
            HStack (spacing: 40){
                Circle()
                    .fill(Color.red)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.color = Color.red
                        userInfo.fontColor = Color.white
                    }
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.color = Color.green
                        userInfo.fontColor = Color.white
                    }
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.color = Color.blue
                        userInfo.fontColor = Color.white
                    }
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.color = Color.yellow
                        userInfo.fontColor = Color.black
                    }
                
                Circle()
                    .fill(Color.purple)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.color = Color.purple
                        userInfo.fontColor = Color.white
                    }
            }.padding()
            
            //Tarjeta
            ZStack{
                Rectangle()
                    .fill(color)
                    .frame(width: 360, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //Si la variable gestor es true mostraremos la parte delantera de la tarjeta, si es false la trasera
                if manager {
                    FrontCardView()
                }else{
                    BackCardView()
                }
            }.padding(40)
            //Rotacion 3d de la tarjeta
            .rotation3DEffect(
                .degrees(manager ? 0 : 360),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .onTapGesture {
                self.manager.toggle() //Cuando pulsemos sobre la tarjeta cambiamos la variable de valor
            }.animation(.spring(dampingFraction: 0.5)) //Animacion
    
            //Texto informativo
            Text("Pulse sobre la tarjeta para ver la cara opuesta")
                .bold()
                .padding(20)
                .font(.custom("Arial", fixedSize:14))
            Spacer()
        }
    }
}

//Estrcutura con la parte delantera de la tarjeta
struct FrontCardView : View{
    @EnvironmentObject var userInfo: UserInfo
    var body: some View{
        HStack{
            ZStack{
                Circle()
                    .fill(Color.white)
                    .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color .black, lineWidth: 3))
                Text((userInfo.name.prefix(1)))
                    .font(.custom("AmericanTypewriter", fixedSize:80.2))
            }
            VStack {
                Text("\(userInfo.name) \(userInfo.surname)")
                    .foregroundColor(userInfo.fontColor)
                    .font(.custom("AmericanTypewriter", size: 25))
                    .frame(width: 200, alignment: .leading)
                Text("\(userInfo.job)")
                    .foregroundColor(userInfo.fontColor)
                    .font(.custom("AmericanTypewriter", size: 20))
                    .frame(width: 200, alignment: .leading)
            }.padding(.trailing)
        }
    }
}

//Estructura con la parte trasera de la tarjeta
struct BackCardView : View{
    @EnvironmentObject var userInfo: UserInfo
    var body: some View{
        VStack (alignment: .leading ){
            HStack{
                Image(systemName: "phone.fill")
                    .foregroundColor(userInfo.fontColor)
                Text("\(userInfo.phone)")
                    .foregroundColor(userInfo.fontColor)
            }
            HStack{
                Image(systemName: "envelope.fill")
                    .foregroundColor(userInfo.fontColor)
                Text("\(userInfo.email)")
                    .foregroundColor(userInfo.fontColor)
            }
            HStack{
                Image(systemName: "house.fill")
                    .foregroundColor(userInfo.fontColor)
                Text("\(userInfo.address)")
                    .foregroundColor(userInfo.fontColor)
            }
        }.font(.custom("AmericanTypewriter", size: 20))
        .frame(width: 300, height: 200)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
