//
//  SheetView.swift
//  Aula04UFES_D2
//
//  Created by Turma02-19 on 17/06/24.
//

import Foundation
import SwiftUI
struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var nome = "Matheus"
    @State private var sobrenome = "Mathias"
    var body: some View {
        ZStack{
            Color(.azulescuro)
                .ignoresSafeArea()
            VStack{
                
                Text("Sheet View")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.top, 10)
                Spacer()
                Text("Nome: \(nome)\n Sobrenome: \(sobrenome)")
                .foregroundStyle(.white)
                .padding()
                .background(.rosa)
                .multilineTextAlignment(.center)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .bold()
                Spacer()
            }
        }
    }
}
