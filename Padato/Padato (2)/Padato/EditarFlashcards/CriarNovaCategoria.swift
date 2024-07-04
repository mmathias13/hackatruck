//
//  CriarNovaCategoria.swift
//  Padato
//
//  Created by Turma02-2 on 28/06/24.
//

import SwiftUI

struct CriarNovaCategoria: View {
    
    @State var vazio = ""
    @State var nomeNovaCategoria = ""
    @State var postResult = ""
    
    var body: some View {
        ZStack
        {
            Color("darkblue")
                .ignoresSafeArea()
            VStack
            {
                TextField("Nome da nova categoria", text: $nomeNovaCategoria)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: sendDataCategoria) {
                    Text("Criar a nova categoria")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Text(postResult)
                    .foregroundColor(.white)
            }
        }
    }
    func sendDataCategoria()
    {
        guard let url = URL(string: "http://192.168.128.101:1880/adicionaflashcard") else {
            print("Invalid URL")
            return
        }
        
        let parameters = [
            "pergunta": vazio,
            "resposta": vazio,
            "categoria": nomeNovaCategoria,
            "dificuldade": vazio
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
                self.postResult = "Categoria criada com sucesso, por favor retorne"
            } else {
                self.postResult = "Falha ao criar o documento. Código de status: \(httpResponse.statusCode)"
            }
        }.resume()
    }
}

#Preview {
    CriarNovaCategoria()
}
