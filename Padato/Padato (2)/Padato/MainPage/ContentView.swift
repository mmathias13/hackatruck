//
//  ContentView.swift
//  Aula09UFES
//
//  Created by Turma02-2 on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
    @State var usuario = "Arnold"
    
    var updateTimer: Timer
    {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                             block:
                                {_ in
            self.date = Date()
        })
    }
    
    init(){
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
       
       
        
        NavigationStack
        {
            ZStack {
                LinearGradient(colors: [Color("darkblue"), Color("darkblue")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Text("Bem-vindo,")
                        .font(.system(size: 45))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .shadow(radius: 50)
                    Text("\(usuario)!")
                        .font(.system(size: 45))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Text("\(timeString(date: date))")
                        .onAppear(perform: {let _ = self.updateTimer})
                        .font(.system(size: 60))
                        .padding()
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    VStack
                    {
                        NavigationLink(destination: SelecionarBaralhos())
                        {
                            Text("RESPONDER BARALHOS")
                                .frame(width: 300, height: 70)
                                .background(Color(.white))
                                .foregroundColor(Color("darkblue"))
                                .font(.system(size: 25))
                                .cornerRadius(10)
                                .padding(3)
                                .fontWeight(.bold)
                        }
                        
                        NavigationLink(destination: MostraTodasCategorias())
                        {
                            Text("EDITAR BARALHOS")
                                .frame(width: 300, height: 70)
                                .background(Color(.white))
                                .foregroundColor(Color("darkblue"))
                                .font(.system(size: 25))
                                .background(Color("darkblue"))
                                .fontWeight(.bold)
                                .cornerRadius(10)
                                .padding(3)
                        }
                        
                        NavigationLink(destination: FlashCardsIA())
                        {
                            Text("PADATO IA")
                                .frame(width: 300, height: 70)
                                .font(.system(size: 25))
                                .background(Color(.white))
                                .foregroundColor(Color("darkblue"))
                                .fontWeight(.bold)
                                .cornerRadius(10)
                                .padding(3)
                        }
                        
                        NavigationLink(destination: Perfil())
                        {
                            Text("PERFIL")
                                .frame(width: 300, height: 70)
                                .font(.system(size: 25))
                                .background(Color(.white))
                                .foregroundColor(Color("darkblue"))
                                .fontWeight(.bold)
                                .cornerRadius(10)
                                .padding(3)
                        }
                    }
                    .padding(30)
                    Spacer()
                }
                .padding()
            }
        }.accentColor(.white)
            
    }
}

#Preview {
    ContentView()
}
