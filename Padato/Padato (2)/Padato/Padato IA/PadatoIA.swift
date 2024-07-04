//
//  ContentView.swift
//  IA
//
//  Created by Turma02-19 on 27/06/24.
//

import SwiftUI
import GoogleGenerativeAI

struct PadatoIA: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = "\nOlá!\nDigite um assunto para que eu automaticamente crie um flashcard sobre!"
    @State var pergunta = ""
    @State var resposta = ""
    @State var categoria: String = "PadatoIA"
    @State private var postResult: String = ""
    
    var body: some View {
        VStack {
            Image("Tigre")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)

            ScrollView{
                Text(aiResponse)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .padding(-5)
            HStack{
                TextField("Digite algo", text: $textInput)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.black)
                Button(action: sendMessage, label: {
                    Image(systemName: "paperplane.fill")
                } )
            }
        }
        .foregroundStyle(.white)
        .padding()
        .background{
            ZStack{
                Color("darkblue")
            }
            .ignoresSafeArea()
        }
        .onChange(of: pergunta) 
        {
            sendData()
        }
    }
    
    func sendMessage(){
        aiResponse = ""
        
        Task{
            do {
                
                let response = try await model.generateContent("Faca um flashcard sobre \(textInput). resposta no modelo pergunta e resposta sem utilizar asteriscos nem negrito, gerando apenas uma pergunta e uma resposta")
                
                guard let text = response.text else {
                    textInput = "Desculpa, não pude processar isso.\nPor favor, tente novamente."
                    return
                }
                textInput = ""
                aiResponse = text
            } catch {
                aiResponse = "Algo deu errado!\n\(error.localizedDescription)"
            }
            let resultado = dividirString(aiResponse)
            pergunta = resultado.0
            resposta = resultado.1
            print("\(resultado.0)")
            print("\(resultado.1)")
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
    PadatoIA()
}
