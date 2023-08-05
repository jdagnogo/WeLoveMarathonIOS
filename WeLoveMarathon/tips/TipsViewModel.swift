//
//  TipsViewModel.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation
import Combine

class TipsViewModel: ObservableObject {
    @Published private(set) var state: Result<Tips> = .idle
    var cancellableSet: Set<AnyCancellable> = []
    let getTipsInteractor : GetTipsInteractor
    
    init(getTipsInteractor: GetTipsInteractor) {
        self.getTipsInteractor = getTipsInteractor
        loadData()
    }

    func loadData(){
        print("starting ..")
        self.state = .loading
        getTipsInteractor.invoke()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Failed with error \(error)")
                    self.state = .failed
                }
            }, receiveValue: { tips in
                print("Data retrieved with size \(tips.count), response = \(tips)")
                self.state = .success(items: tips)
            })
            .store(in: &cancellableSet)
    }
}
    
