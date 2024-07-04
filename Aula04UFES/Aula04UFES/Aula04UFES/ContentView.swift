//
//  ContentView.swift
//  Aula04UFES
//
//  Created by Turma02-19 on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            TabView{
                BushView()
                    .tabItem {
                        Label("Rosa", systemImage: "paintbrush.fill")
                    }
                AzulView()
                    .tabItem {
                        Label("Azul", systemImage: "paintbrush.pointed.fill")
                    }
                CinzaView()
                    .tabItem {
                        Label("Cinza", systemImage: "paintpalette.fill")
                    }
                ListView()
                    .tabItem {
                        Label("Lista", systemImage: "list.bullet")
                    }
            }//TAB VIEW
        }//VSTACK1
    } //VAR BODY
} // STRUCT

#Preview {
    ContentView()
}
