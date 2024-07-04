import Foundation

func dividirString(_ input: String) -> (String, String) {
    // Encontra a posição da substring "Pergunta:" na string
    guard let perguntaRange = input.range(of: "Pergunta:") else {
        return ("", "")
    }
    
    // Encontra a posição da substring "Resposta:" na string
    guard let respostaRange = input.range(of: "Resposta:") else {
        return ("", "")
    }
    
    // Define as partes da string após "Pergunta:" e "Resposta:"
    let perguntaParte = input[perguntaRange.upperBound..<respostaRange.lowerBound].trimmingCharacters(in: .whitespacesAndNewlines)
    let respostaParte = input[respostaRange.upperBound...].trimmingCharacters(in: .whitespacesAndNewlines)
    
    return (String(perguntaParte), String(respostaParte))
}



