//
//  Desafio2.swift
//  Aula01UFES
//
//  Created by Turma02-19 on 06/06/24.
//

import SwiftUI

struct Desafio2: View {
    var body: some View {
        HStack{
            Image("Hackatruck")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 30)
            VStack(spacing: 10){
            Text("HackaTruck")
                .foregroundStyle(.red)
                .bold()
            Text("77 Universidades")
                .foregroundStyle(.blue)
                .bold()
            Text("6 regiões do Brasil")
                .foregroundStyle(.yellow)
                .bold()
        }
    }
    }
}

#Preview {
    Desafio2()
}
