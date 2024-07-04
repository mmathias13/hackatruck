//
//  ContentView.swift
//  Aula03UFES
//
//  Created by Turma02-19 on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var imc = "";
    @State private var peso: String = "";
    @State private var altura = "";
    @State private var peso2: Float = 0.0;
    @State private var altura2: Float = 0.0;
    @State private var result: Float = 0.0;
    @State private var color: String = "";
    var body: some View {
     
        VStack (alignment: .center){
            
            ZStack(){
                Rectangle()
                    .foregroundColor(Color(imc))
                    .ignoresSafeArea()
                VStack(){
                    Text("Calculadora de IMC")
                        .bold()
                        .font(.system(size: 30))
                    //Spacer()
                    VStack(){
                        TextField("Digite seu peso (Kg)", text: $peso)
                            .frame(width: 350, height: 40)
                            .background(.white)
                            .padding(.bottom,30)
                            .multilineTextAlignment(.center)
                        // .overlay(
                        TextField("Digite sua altura (M)", text: $altura)
                            .frame(width: 350, height: 40)
                            .background(.white)
                            .multilineTextAlignment(.center)
                        Button("Calcular"){
                            altura2 = Float(altura) ?? 0.0
                            peso2 = Float(peso) ?? 0.0
                            result = peso2 / (altura2 * altura2)
                            if result < 18.5{
                                imc = "Abaixo"
                            }
                            else if result >= 18.5 && result <= 24.99{
                                imc = "Normal"
                            }
                            else if result >= 25 && result <= 29.99 {
                                imc = "Sobrepeso"
                            }
                            else if result > 30{
                                imc = "Obesidade"
                            }
                        }
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                    }
                    Spacer()
                    VStack(alignment: .center){
                        Text(imc)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                                                }
                    Spacer()
                    VStack(){
                        Image("tabela-IMC")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
