//
//  File.swift
//  Aula09UFES
//
//  Created by Turma02-2 on 21/06/24.
//

import Foundation

enum NivelDificuldade {
    case facil,
         medio,
         dificil,
         muitoDificil
}

struct Cartao: Identifiable {
    var id = UUID()
    var pergunta: String
    var resposta: String
    var dificuldade: NivelDificuldade
}

struct Baralho: Identifiable {
    var id = UUID()
    var titulo: String
}

var timeFormat: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}

func timeString(date: Date) -> String {
    let time = timeFormat.string(from: date)
    return time
}
