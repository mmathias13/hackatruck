//
//  structview.swift
//  Padato
//
//  Created by Turma02-2 on 26/06/24.
//

import Foundation

struct FCard: Decodable, Hashable
{
    var _id: String?
    var _rev: String?
    var pergunta: String?
    var resposta: String?
    var dificuldade: String?
    var categoria: String?
}


class ViewModel : ObservableObject
{
    @Published var flashcards : [FCard] = []
    
    
    func fetchFlashcards(){
        guard let url = URL(string: "http://192.168.128.101:1880/mostraflashcard") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do{
                let jsonDecodificado = try JSONDecoder().decode([FCard].self, from: data)
                
                DispatchQueue.main.async{
                    self?.flashcards = jsonDecodificado
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    func flashCardsWithoutCategories() -> [FCard]{
        return flashcards.filter{$0.pergunta!.isEmpty == false}
    }
}
