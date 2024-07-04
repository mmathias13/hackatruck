import SwiftUI

struct EditarOuRemover: View {
    
    @State var flashcardEditarOuRemover: FCard?
    @State var deletionResult = ""
    @State var categoria = ""
    
    // Adicione o Environment para controlar a apresentação
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("darkblue")
                    .ignoresSafeArea()
                VStack {
                    Text(flashcardEditarOuRemover?.pergunta ?? "")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text(categoria)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    VStack {
                        Spacer()
                        NavigationLink(destination: EditarBaralho(flashcard: flashcardEditarOuRemover)) {
                            Text("Editar")
                                .frame(width: 70, height: 30)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .bold()
                        }
                        Button(action: {
                            deleteData(withId: flashcardEditarOuRemover?._id ?? "", andRev: flashcardEditarOuRemover?._rev ?? "")
                        }) {
                            Text("Deletar")
                                .frame(width: 70, height: 30)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .bold()
                        }
                        .padding()
                        
                        Text(deletionResult)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
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
                self.deletionResult = "Documento deletado com sucesso"
            } else {
                self.deletionResult = "Falha ao deletar o documento. Código de status: \(httpResponse.statusCode)"
            }
        }.resume()
    }
}

#Preview {
    EditarOuRemover()
}
