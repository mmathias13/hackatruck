//
//  Utilas.swift
//  Padato
//
//  Created by Turma01-24 on 01/07/24.
//

extension Array where Element: Hashable {
    
    func after(_ item : Element) -> Element? {
        
        var index = self.firstIndex(where: {$0 == item})
        
        index = index!.advanced(by: 1)
        index =  index! >= self.endIndex ? 0 : index
        
        return self[index!]
    }
    
    func before(_ item : Element) -> Element? {
        var index = self.firstIndex(where: {$0 == item})
        index = index! == 0 ? self.endIndex-1 : index!.advanced(by:  -1)
        
        return self[index!]
    }
    
}
