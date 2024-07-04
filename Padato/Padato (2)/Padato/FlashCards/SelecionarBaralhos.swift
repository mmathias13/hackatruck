import Foundation
import SwiftUI

struct SelecionarBaralhos: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hue: 0.641, saturation: 0.916, brightness: 0.886).ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "menucard.fill")
                            .resizable()
                            .frame(width: 30, height: 50)
                            .foregroundStyle(.white)
                        Text("Selecione o seu baralho:")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.system(size: 27))
                    }
                    List( Array(Dictionary(grouping: viewModel.flashCardsWithoutCategories(), by: { $0.categoria })), id: \.key
                    ){ a  in
                        NavigationLink(destination: PerguntaCartaoView(baralho: a.value, tituloBaralho: a.key! )) {
                            HStack {
                                Image(systemName: "largecircle.fill.circle")
                                Text("\(a.key!)")
                            }
                        }
                    }.foregroundStyle(Color(red: 0.07058823529411765, green: 0.19607843137254902, blue: 0.8823529411764706))
                    
//                    List(viewModel.flashcards.filter { $0.pergunta?.isEmpty == true && $0.resposta?.isEmpty == true && $0.dificuldade?.isEmpty == true }, id: \.self) { baralho in
//                        
//                        NavigationLink(destination: PerguntaCartaoView(viewModel: viewModel, tituloBaralho: baralho.categoria ?? "")) {
//                            HStack {
//                                Image(systemName: "largecircle.fill.circle")
//                                Text(baralho.categoria ?? "")
//                            }
//                        }.simultaneousGesture(TapGesture().onEnded {
//                            print("Hello world!")
//                        })
//                    }
//                    .foregroundStyle(Color(red: 0.07058823529411765, green: 0.19607843137254902, blue: 0.8823529411764706))
                }
            }
        }
        .onAppear {
            viewModel.fetchFlashcards()
        }
    }
}

#Preview {
    SelecionarBaralhos()
}
