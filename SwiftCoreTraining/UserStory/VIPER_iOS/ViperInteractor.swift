//
//  ViperInteractor.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 6/16/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import Foundation

final class ViperInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchPersons() {
        
        guard  let path = Bundle.main.path(forResource: "persons", ofType: "json")  else {
            assertionFailure("Unable to locate file")
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let response = try JSONDecoder().decode(PersonResponse.self, from: data)
            self.presenter?.personsFetchedSuccess(personsModelArray: response.users)
        } catch {
            assertionFailure(error.localizedDescription)
            self.presenter?.personsFetchFailed(error: error.localizedDescription)
        }
    }
    
}
