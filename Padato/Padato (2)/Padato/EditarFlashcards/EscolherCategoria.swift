import SwiftUI

struct EscolherCategoria: View {
    @StateObject var viewModel = ViewModel()
    @State var _id = ""
    @State var _rev = ""
    @State var categoriaEscolhida = ""
    @State var deletionResult = ""
    
    var body: some View {
        NavigationStack
        {
            ZStack {
                Color("darkblue")
                    .ignoresSafeArea()
                
                VStack
                {
                    Spacer()
                    Text("Escolha uma categoria e continue")
                        .frame(width: 300, height: 70)
                        .background(Color(.white))
                        .foregroundColor(Color("darkblue"))
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)
                        .cornerRadius(10)
                        .padding(3)
                        .fontWeight(.bold)
                        .padding()
                    
                    Picker("Categoria", selection: $categoriaEscolhida) {
                        ForEach(viewModel.flashcards, id: \.self) { item in
                            if item.pergunta == "" && item.resposta == "" && item.dificuldade == "" {
                                Text(item.categoria ?? "")
                                    .tag(item.categoria ?? "")
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .onChange(of: categoriaEscolhida) { newCategoria in
                        if let selectedItem = viewModel.flashcards.first(where: { $0.categoria == newCategoria }) {
                            _id = selectedItem._id!
                            _rev = selectedItem._rev!
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .background(Color.blue)
                    .pickerStyle(MenuPickerStyle())
                    .padding()

                    NavigationLink(destination: CriarNovaCategoria())
                    {
                        Text("Criar nova categoria")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                    Button(action: {
                        deleteData(withId: _id, andRev: _rev)
                    }) {
                        Text("Deletar categoria")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Text(deletionResult)
                        .foregroundColor(.white)
                    
                    Spacer()
                    VStack
                    {
                        NavigationLink(destination: AdicionarBaralhos(categoria: categoriaEscolhida))
                        {
                            VStack {
                                Text("Categoria escolhida:\n \(categoriaEscolhida)")
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color("darkblue"))
                                    .cornerRadius(10)
                                    .font(.system(size: 20))

                                Image(systemName: "arrowshape.right.fill")
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchFlashcards()
                }
            }
        }
    }
    func deleteData(withId documentId: String, andRev revision: String) {
        let urlString = "http://192.168.128.101:1880/deletaflashcard"
        
        guard let url = URL(string: urlString) else {
            self.deletionResult = "URL inválida: \(urlString)"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Monta o body da requisição
        let requestBody: [String: Any] = [
            "_id": documentId,
            "_rev": revision
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            self.deletionResult = "Erro ao serializar dados JSON: \(error.localizedDescription)"
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.deletionResult = "Erro ao deletar documento: \(error.localizedDescription)"
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.deletionResult = "Resposta inválida do servidor"
                return
            }
            
            if httpResponse.statusCode == 200 {
                self.deletionResult = "Baralho deletado com sucesso"
            } else {
                self.deletionResult = "Falha ao deletar o documento. Código de status: \(httpResponse.statusCode)"
            }
        }.resume()
    }
}

#Preview {
    EscolherCategoria()
}
