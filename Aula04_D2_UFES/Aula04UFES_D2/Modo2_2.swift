//
//  Modo2_2.swift
//  Aula04UFES_D2
//
//  Created by Turma02-19 on 17/06/24.
//

import SwiftUI

struct Modo2_2: View {
    var body: some View {
        ZStack{
            Color(.azulescuro)
                .ignoresSafeArea()
            VStack{
                Text("Volte, \nMatheus!")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color("rosa"))
                    .multilineTextAlignment(.center)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .bold()
                    .cornerRadius(5)
            }
        }
    }
}

#Preview {
    Modo2_2()
}
