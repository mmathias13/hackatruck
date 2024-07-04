
//  Desafio 3.swift
//  Aula01UFES
//
//  Created by Turma02-19 on 06/06/24.
//

import SwiftUI

struct Desafio_3: View {
    var body: some View {
        VStack{
            HStack(spacing: 20){
                Circle()
                    .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.923))
                    .frame(width: 100, height: 100)
                VStack{
                    HStack{
                        VStack{
                            Text("8")
                                .bold()
                            Text("Posts")
                                .bold()
                        }
                        VStack{
                            Text("12k")
                                .bold()
                            Text("Seguidores")
                                .bold()
                        }
                        VStack{
                            Text("2k")
                                .bold()
                            Text("Seguindo")
                                .bold()
                        }
                    }
                    Rectangle()
                        .frame(width: 240, height: 30)
                        .foregroundColor(Color(red: 0.922, green: 0.922, blue: 0.922))
                        .overlay{
                            Text("Editar Perfil")
                                .bold()
                        }
                }
            }
            Text("Nome Sobrenome")
                .bold()
                .padding(.trailing, 200)
                .padding(.top, 20)
            Text("Aqui ficará a biografia")
                .padding(.trailing, 180)
                .padding(.bottom, 50)

            VStack{
                HStack{
                    Spacer()
                    Image("Image 1")
                    Spacer()
                    Spacer()
                    Image("Image 2")
                    Spacer()
                    Spacer()
                    Image("Image 3")
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .foregroundColor(Color(red: 0.922, green: 0.922, blue: 0.922))
                        .frame(width: 120, height: 120)
                    Rectangle()
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.922, green: 0.922, blue: 0.922)/*@END_MENU_TOKEN@*/)
                        .frame(width: 120, height: 120)
                    Rectangle()
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.922, green: 0.922, blue: 0.922)/*@END_MENU_TOKEN@*/)
                        .frame(width: 120, height: 120)
                }
                HStack{
                    Rectangle()
                        .foregroundColor(Color(red: 0.922, green: 0.922, blue: 0.922))
                        .frame(width: 120, height: 120)
                    Rectangle()
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.922, green: 0.922, blue: 0.922)/*@END_MENU_TOKEN@*/)
                        .frame(width: 120, height: 120)
                    Rectangle()
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.922, green: 0.922, blue: 0.922)/*@END_MENU_TOKEN@*/)
                        .frame(width: 120, height: 120)
                }
                HStack{
                    Rectangle()
                        .foregroundColor(Color(red: 0.922, green: 0.922, blue: 0.922))
                        .frame(width: 120, height: 120)
                    Rectangle()
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.922, green: 0.922, blue: 0.922)/*@END_MENU_TOKEN@*/)
                        .frame(width: 120, height: 120)
                    Rectangle()
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.922, green: 0.922, blue: 0.922)/*@END_MENU_TOKEN@*/)
                        .frame(width: 120, height: 120)
                }
                }
            }
        }
    }
#Preview {
    Desafio_3()
}
