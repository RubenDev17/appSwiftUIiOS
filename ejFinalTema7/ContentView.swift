//
//  ContentView.swift
//  ejFinalTema7
//
//  Created by user184221 on 2/22/21.
//

import SwiftUI
import Combine
//Creamos la clase ObservableObject para poder compartir los datos
class UserInfo: ObservableObject {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var job : String = ""
    @Published var phone : String = ""
    @Published var email : String = ""
    @Published var address : String = ""
    @Published var fontColor : Color = Color.white
}

struct ContentView: View {
    //Declaramos una variable de tipo userInfo para guardar los datos
    @EnvironmentObject var userInfo: UserInfo

    var body: some View {
        VStack{
            //Titular
            Text("Tus datos")
                .font(.title)
            //Formulario
            Form{
                TextField("Nombre", text: $userInfo.name)
                TextField("Apellido", text: $userInfo.surname)
                TextField("Puesto de trabajo", text: $userInfo.job)
                Section{
                    TextField("Teléfono", text: $userInfo.phone)
                        //Solo podremos escribir numeros
                        .keyboardType(.numberPad)
                        .onReceive(Just(userInfo.phone)){ newValue in
                            let filtered = newValue.filter {"0123456789".contains($0)}
                            if filtered != newValue {
                                self.userInfo.phone = filtered
                            }
                        }
                    
                    TextField("Email", text: $userInfo.email)
                    TextField("Dirección", text: $userInfo.address)
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
