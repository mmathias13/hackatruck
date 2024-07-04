//
//  Ofensiva.swift
//  Padato
//
//  Created by Turma02-2 on 24/06/24.
//

import SwiftUI

struct Amigos: View {
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    NavigationLink(destination: Usuario2()){
                        Text("@Usuario2")
                            .bold()
                     
                    }
                    NavigationLink(destination: Usuario3()){
                        Text("@Usuario3")
                            .bold()
                    }
                    NavigationLink(destination: Usuario4()){
                        Text("@Usuario4")
                            .bold()
                    }
                    .navigationTitle("Amigos")
                }
                .scrollContentBackground(.hidden)
                .background(Color.darkblue.edgesIgnoringSafeArea(.all))
                
            }
        }
    }
}

#Preview {
    Amigos()
}
                 
