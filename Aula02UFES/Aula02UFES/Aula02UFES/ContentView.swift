//
//  ContentView.swift
//  Aula02UFES
//
//  Created by Turma02-19 on 07/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var showingAlert = false
    var body: some View {
        VStack {
            
            ZStack{
                Image("Captura de Tela 2023-01-18 às 22.59.48")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.2)
                    .ignoresSafeArea()
                 
                VStack{
                        VStack(alignment:.center) {
                            Text("Bem vindo, \(name)")
                                .font(.system(size:35))
                                .bold()
                            TextField("Nome", text: $name)
                                .bold()
                                .font(.system(size: 20))
                                .frame(width:70, height:50)
                            Spacer()
                        }
                    VStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 250, height: 110)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Image("truck")
                            .resizable()
                            .frame(width:200, height: 100)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    }

                 
                    VStack {
                        Spacer()
                        Button("Entrar"){
                            showingAlert = true
                        }
                        .alert(isPresented: $showingAlert){
                            Alert(title: Text("ALERTA!")
                                .bold(),
                                  message: Text("Você irá iniciar o desafio da aula agora"),
                                  dismissButton: .default(Text("Vamos lá!"))
                            )
                    }
                    }
                }
            }
        }
        //.padding()
    }
}

#Preview {
    ContentView()
}
