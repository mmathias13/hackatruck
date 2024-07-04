//
//  Modo 2.swift
//  Aula04UFES_D2
//
//  Created by Turma02-19 on 11/06/24.
//

import SwiftUI

struct Modo_2: View {
    @State private var nome = "Matheus"
    @State private var sobrenome = "Mathias"
    var body: some View {
        ZStack{
            Color("azulescuro")
                .ignoresSafeArea()
            VStack{
                Text("Modo 2")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
                ZStack{
                    Rectangle()
                        .foregroundStyle(.rosa)
                        .frame(width: 200, height: 100)
                        .cornerRadius(5)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("\(nome)\n Bem-Vindo, \(nome)")
                            .foregroundStyle(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .bold()
                        NavigationLink(destination: Modo2_2()){
                            Text("Acessar Tela")
                                .foregroundStyle(.white)
                                .bold()
                                .background(Rectangle()
                                    .background(Color(.blue))
                                    .cornerRadius(5)
                                    .frame(width: 120, height: 25)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/))
                                .padding(.bottom)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    Modo_2()
}
