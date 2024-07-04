//
//  Tela streak.swift
//  Projeto
//
//  Created by Turma02-15 on 25/06/24.
//

import SwiftUI

struct Estatisticas_do_Usuario: View {
    let rows = Array(repeating: GridItem(.fixed(20), spacing: 4), count: 7)
    let data: [Int] = [
        0, 1, 2, 3, 4, 5, 6,
        1, 0, 3, 2, 4, 1, 0,
        0, 0, 1, 2, 3, 1, 4,
        3, 2, 1, 0, 1, 2, 3,
        1, 4, 3, 2, 1, 0, 1,
        2, 3, 4, 1, 0, 1, 2,
        4, 3, 2, 1, 0, 1, 4,
        0, 1, 2, 3, 4, 5, 6,
        1, 0, 3, 2, 4, 1, 0,
        0, 0, 1, 2, 3, 1, 4,
        3, 2, 1, 0, 1, 2, 3,
        1, 4, 3, 2, 1, 0, 1,
        2, 3, 4, 1, 0, 1, 2,
        4, 3, 2, 1, 0, 1, 4,
        0, 1, 2, 3, 4, 5, 6,
        1, 0, 3, 2, 4, 1, 0,
        0, 0, 1, 2, 3, 1, 4,
        3, 2, 1, 0, 1, 2, 3,
        1, 4, 3, 2, 1, 0, 1,
        2, 3, 4, 1, 0, 1, 2,
        4, 3, 2, 1, 0, 1, 4,
        1, 0, 3, 2, 4, 1, 6,
        0, 0, 1, 2, 3, 1, 4,
        3, 2, 1, 0, 1, 2, 3,
        1, 4, 3, 2, 1, 0, 1,
        2, 3, 4, 1, 0, 1, 2,
        4, 3, 2, 1, 0, 1, 4
    ]
    @State private var currentStreak = 0
    let daysOfWeek = ["S", "T", "Q", "Q", "S", "S", "D"]
    
    var streaks: [Int] {
        var streak = 0
        return data.map { value in
            if value > 0 {
                streak += 1
            } else {
                streak = 0
            }
            return streak
        }
    }
    
    var body: some View {
        ZStack{
            Color(hue: 0.641, saturation: 0.916, brightness: 0.886).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Calendário de estudos").foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.bottom,35)
                    .bold()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 4) {
                        ForEach(0..<data.count, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .fill(self.color(for: self.data[index]))
                                    .frame(width: 20, height: 20)
                                
                                Text(daysOfWeek[index % 7])
                                    .foregroundColor(.black)
                                    .font(.caption)
                            }
                            .onAppear {
                                if index == data.count - 1 {
                                    currentStreak = streaks[index]
                                }
                            }
                        }
                    }
                    .padding()
                }.padding(.bottom,50)
                    .onChange(of: data, perform: { _ in
                        currentStreak = streaks.last ?? 0
                    })
                
                VStack {
                    Image(systemName: "flame.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170)
                        .foregroundColor(.orange)
                    Text("\(currentStreak) dias seguidos!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .shadow(radius: 10)
                }
            }
        }
    }
    func color(for value: Int) -> Color {
        switch value {
        case 0:
            return Color(.white)
        case 1:
            return Color(.systemGreen).opacity(1)
        case 2:
            return Color(.systemGreen).opacity(0.9)
        case 3:
            return Color(.systemGreen).opacity(0.8)
        case 4:
            return Color(.systemGreen).opacity(0.6)
        case 5:
            return Color(.systemGreen).opacity(0.4)
        default:
            return Color(.systemGreen).opacity(0.2)
        }
    }
}

#Preview {
    Estatisticas_do_Usuario()
}
