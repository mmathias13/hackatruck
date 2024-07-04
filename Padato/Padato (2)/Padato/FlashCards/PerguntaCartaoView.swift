import Foundation
import SwiftUI

struct PerguntaCartaoView: View {
    @StateObject var viewModel =  ViewModel()
    var baralho: [FCard]?
    // @State private var indiceCartaoAtual: Int = 0
    
    @State var tituloBaralho : String
    @State var cartaoAtual : FCard?
    
    @State private var contadorTempo = 0
    @State private var timer: Timer?
    
    @State var primeiravez = true
    
    @State var contagem : Int?
    
    //    // Retorna o flashcard atual
    //    var cartaoAtual: FCard {
    //        cartoes[indiceCartaoAtual]
    //    }
    //
    //    init(viewModel: ViewModel, tituloBaralho: String, indiceCartaoAtual: Int = 0) {
    //        self.viewModel = viewModel
    //        self.tituloBaralho = tituloBaralho
    //       // self._indiceCartaoAtual = State(initialValue: indiceCartaoAtual)
    //    }

    var body: some View {
        //        VStack{
        //            Text("\(baralho!.count)")
        //            ForEach(baralho!, id: \.self){ teste in
        //                Text(teste.pergunta!)
        //            }
        //        }
        ZStack
        {
            LinearGradient(colors: [Color("darkblue"), Color("darkblue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack
            {
                if(cartaoAtual != nil){
                    Spacer()
                    // Exibe a pergunta do flashcard atual
                    Text(cartaoAtual!.pergunta ?? "")
                        .font(.largeTitle)
                        .padding(.top, 20)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                    // Exibe o tempo decorrido
                    Text("Tempo: \(contadorTempo)")
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                    // Navega para a view de resposta do flashcard atual
                    NavigationLink(destination: RespostaCartaoView(cartao: cartaoAtual!, tituloBaralho: tituloBaralho, baralho: baralho, contagem: contagem!)) {
                        Text("Mostrar Resposta")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            .navigationTitle(tituloBaralho)
            .onAppear {
                self.iniciarTimer()
       
                
                print(contagem)
                if(primeiravez){
                    contagem = 1
                    primeiravez = false
                    cartaoAtual = baralho!.first!
                }else{
                    contagem! += 1
                }
                
                print(contagem)
                   
            }
            .onDisappear {
                self.pararTimer()
            }
        }
    }
    
    // Inicia o timer
    private func iniciarTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.contadorTempo += 1
        }
    }
    
    // Para o timer
    private func pararTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    // Retorna o próximo flashcard, se existir
    //    private func proximoCartao() -> FCard? {
    //        let proxIndice = indiceCartaoAtual + 1
    //        if proxIndice < cartoes.count {
    //            indiceCartaoAtual = proxIndice
    //            return cartoes[proxIndice]
    //        } else {
    //            return nil
    //        }
    //    }
    
    
}

