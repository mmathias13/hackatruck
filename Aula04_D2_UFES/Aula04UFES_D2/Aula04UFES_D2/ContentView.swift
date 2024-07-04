//
//  ContentView.swift
//  Aula04UFES_D2
//
//  Created by Turma02-19 on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color("azulescuro")
                    .ignoresSafeArea()
                VStack{
                    Image("logo")
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .resizable()
                        .frame(width: 200, height: 110)
                        .rotationEffect(.degrees(+6))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: Modo_1()){
                        Text("Modo 1")
                            .frame(width: 200, height: 50)
                            .background(Color("rosa"))
                            .foregroundStyle(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .cornerRadius(5)
                    }
                    NavigationLink(destination: Modo_2()){
                        Text("Modo 2")
                            .frame(width: 200, height: 50)
                            .background(Color("rosa"))
                            .foregroundStyle(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .cornerRadius(5)
                    }
                    Button("Modo 3"){
                        showingSheet.toggle()
                    } .sheet(isPresented: $showingSheet) {
                        SheetView()
                    }
                    .frame(width: 200, height: 50)
                    .background(Color("rosa"))
                    .foregroundStyle(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .cornerRadius(5)
                    Spacer()
                }
            }
        }
        //.padding()
    }
}

#Preview {
    ContentView()
}
