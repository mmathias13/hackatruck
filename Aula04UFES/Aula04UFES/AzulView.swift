//
//  BushView.swift
//  Aula04UFES
//
//  Created by Turma02-19 on 11/06/24.
//

import SwiftUI

struct AzulView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .padding(.bottom, 100)
                .frame(width: 400, height: 900)
                .foregroundColor(.blue)
            Image(systemName: "paintbrush.pointed")
                .foregroundColor(.blue)
                .font(.system(size: 144))
                .background(Circle()
                    .frame(width: 300, height: 250))
        }
    }
}

#Preview {
    AzulView()
}
