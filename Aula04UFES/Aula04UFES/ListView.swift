//
//  ListView.swift
//  Aula04UFES
//
//  Created by Turma02-19 on 11/06/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush")
                    }
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush.pointed")
                    }
                    HStack{
                        Text("Item")
                            Spacer()
                        Image(systemName: "paintpalette")
                    }
                }
                .navigationTitle("Lista")
            }
        }
    }
}

#Preview {
    ListView()
}
