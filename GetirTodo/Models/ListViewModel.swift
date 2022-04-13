//
//  ListViewModel.swift
//  GetirTodo
//
//  Created by kishor garkal on 04/04/22.
//

struct ListViewModel {
    var listItems: [ListItem] {
        return CoreDataController.shared.listItems
    }
    
    func addListItem(with name: String) {
        CoreDataController.shared.addListItem(with: name)
    }
    
    func removeListItem(with name: String?) {
        guard let name = name else { return }
        
        CoreDataController.shared.removeListItem(with: name)
    }
}
