import SwiftUI

struct AdicionarBaralhos: View {
    @State private var pergunta: String = ""
    @State private var resposta: String = ""
    @State var categoria: String = ""
    @State private var postResult: String = ""
    
    var body: some View {
        ZStack {
            Color("darkblue")
                .ignoresSafeArea()
            VStack {
                Text(categoria)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color("darkblue"))
                    .cornerRadius(10)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                TextField("Pergunta", text: $pergunta)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Resposta", text: $resposta)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: sendData) {
                    Text("Adicionar FlashCard")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Text(postResult)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
    
    func sendData()
    {
        guard let url = URL(string: "http://192.168.128.101:1880/adicionaflashcard") else {
            print("Invalid URL")
            return
        }
        
        let parameters = [
            "pergunta": pergunta,
            "resposta": resposta,
            "categoria": categoria,
            "dificuldade": "muitoDificil"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        } catch let error {
            print("Error serializing parameters: \(error.localizedDescription)")
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending data: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("Data sent successfully")
                } else {
                    print("Failed to send data. Status code: \(httpResponse.statusCode)")
                }
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.postResult = "Resposta inválida do servidor"
                return
            }
            
            if httpResponse.statusCode == 200 {
                self.postResult = "Baralho criado com sucesso"
            } else {
                self.postResult = "Falha ao criar o baralho. Código de status: \(httpResponse.statusCode)"
            }
        }.resume()
    }
}

#Preview {
    AdicionarBaralhos()
}
