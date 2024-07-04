//
//  ContentView.swift
//  Padato
//
//  Created by Turma02-19 on 21/06/24.
//

import SwiftUI

struct Usuario3: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color("darkblue")
                    .ignoresSafeArea()
                VStack {
                    
                    ZStack{
                        VStack{
                            Image("Capa")
                                .resizable()
                                .scaledToFill()
                                .frame(width:10, height: 200)
                            Spacer()
                        }
                        VStack{
                            
                            Image("Perfil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .shadow(radius: 700)
                            
                            Text("@Usuario3")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .bold()
                                .shadow(radius: 10)
                            
                            Spacer()
                        }
                    }
                    }.padding(65)
                  
                }
                
            }
        }
    }

#Preview {
    Usuario3()
}
