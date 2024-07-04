//
//  Modo 1.swift
//  Aula04UFES_D2
//
//  Created by Turma02-19 on 11/06/24.
//

import SwiftUI

struct Modo_1: View {
    @State private var nome = "Matheus"
    @State private var sobrenome = "Mathias"
    var body: some View {
        ZStack{
            Color("azulescuro")
                .ignoresSafeArea()
            VStack{
                Text("Modo 1")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
                Text("Nome: \(nome)\n Sobrenome: \(sobrenome)")
                .foregroundStyle(.white)
                .padding()
                .background(.rosa)
                .multilineTextAlignment(.center)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .bold()
                .cornerRadius(5)
                Spacer()
            }
        }
    }
}

#Preview {
    Modo_1()
}
