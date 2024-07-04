//
//  BushView.swift
//  Aula04UFES
//
//  Created by Turma02-19 on 11/06/24.
//

import SwiftUI

struct CinzaView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .padding(.bottom, 100)
                .frame(width: 400, height: 900)
                .foregroundColor(.gray)
            Image(systemName: "paintpalette")
                .foregroundColor(.gray)
                .font(.system(size: 144))
                .background(Circle()
                    .frame(width: 300, height: 250))
        }
    }
}

#Preview {
    CinzaView()
}
