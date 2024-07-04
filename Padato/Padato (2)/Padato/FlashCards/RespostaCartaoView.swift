import Foundation
import SwiftUI

struct RespostaCartaoView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var cartao: FCard
    var tituloBaralho: String
    var baralho: [FCard]?
    
    @State private var mostrarProximoCartao = false
    @State private var mostrarSelecaoDeBaralhos = false

    @State var contagem : Int
    
    var body: some View {
        ZStack{
            Color("darkblue")
                .ignoresSafeArea()
            VStack {
                Spacer()
                // Exibe a resposta do flashcard atual
                Text(cartao.resposta ?? "")
                    .font(.largeTitle)
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                // Botões para selecionar a dificuldade
                HStack(spacing: 10) {
                    Button(action: {
                        atualizarDificuldadeENavegar("facil")
                    }) {
                        Text("Facil")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Button(action: {
                        atualizarDificuldadeENavegar("medio")
                    }) {
                        Text("Medio")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Button(action: {
                        atualizarDificuldadeENavegar("dificil")
                    }) {
                        Text("Dificil")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Button(action: {
                        atualizarDificuldadeENavegar("muitoDificil")
                    }) {
                        Text("Muito Dificil")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }.onAppear(){
                print("C\(contagem)")
                print("B\(baralho!.count)")
            }
        }
        .navigationTitle(tituloBaralho)
        // Navega para o próximo flashcard ou de volta para a seleção de baralhos
        .navigationDestination(isPresented: $mostrarProximoCartao) {
          // if let proximoCartao = proximoCartao {
            
            
            if(contagem < Int(baralho!.count)){
                PerguntaCartaoView(baralho: baralho!, tituloBaralho: tituloBaralho, cartaoAtual: cartao, primeiravez: false, contagem : contagem)
            
            } else {
                ContentView().navigationBarBackButtonHidden(true)
            }
        }
        .navigationDestination(isPresented: $mostrarSelecaoDeBaralhos) {
            ContentView().navigationBarBackButtonHidden(true)
        }
    }

    // Atualiza a dificuldade do flashcard e navega
     func atualizarDificuldadeENavegar(_ dificuldade: String) {
        guard let url = URL(string: "http://192.168.128.101:1880/atualizaflashcard") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody: [String: Any] = [
            "_id": cartao._id ?? "",
            "_rev": cartao._rev ?? "",
            "pergunta": cartao.pergunta ?? "",
            "resposta": cartao.resposta ?? "",
            "dificuldade": dificuldade,
            "categoria": cartao.categoria ?? ""
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                // Navega para o próximo cartão ou para a seleção de baralhos
                DispatchQueue.main.async {
                   
                        cartao = (baralho!.after(cartao)!)
                        mostrarProximoCartao = true
//                    } else {
//                        mostrarSelecaoDeBaralhos = true
//                    }
                }
            }
        }.resume()
    }
}
