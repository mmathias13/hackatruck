import SwiftUI

struct EditarBaralho: View {
    
    @State var pergunta = ""
    @State var resposta = ""
    @State var flashcard: FCard?
    @State var editResult: String = ""
    
    var body: some View {
        ZStack {
            Color("darkblue")
                .ignoresSafeArea()
            
            VStack {
                Text("Editar")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .bold()
                Spacer()
                
                TextField("Nova Pergunta", text: $pergunta)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Nova Resposta", text: $resposta)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action:
                {
                    editData(withId: (flashcard?._id)!, andRev: (flashcard?._rev)!)
                })
                {
                    Text("Editar")
                        .frame(width: 100, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
                .padding()
                
                Text(editResult)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
            }
        }
    }
    
    func editData(withId documentId: String, andRev revision: String) {
        let urlString = "http://192.168.128.101:1880/atualizaflashcard"
        
        guard let url = URL(string: urlString) else {
            self.editResult = "URL inválida: \(urlString)"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Monta o body da requisição
        let requestBody: [String: Any] = [
            "_id": documentId,
            "_rev": revision,
            "pergunta": pergunta,
            "resposta": resposta,
            "dificuldade": flashcard?.dificuldade ?? ""  // Use ?? para fornecer um valor padrão caso flashcard?.dificuldade seja nil
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            self.editResult = "Erro ao serializar dados JSON: \(error.localizedDescription)"
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.editResult = "Erro ao editar documento: \(error.localizedDescription)"
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.editResult = "Resposta inválida do servidor"
                return
            }
            
            if httpResponse.statusCode == 200 {
                self.editResult = "Baralho editado com sucesso"
            } else {
                self.editResult = "Falha ao editar documento. Código de status: \(httpResponse.statusCode)"
            }
        }.resume()
    }
}

struct EditarBaralho_Previews: PreviewProvider {
    static var previews: some View {
        EditarBaralho()
    }
}
