//
//  AboutViewModel.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import Combine

class AboutViewModel: ObservableObject {
    @Published private(set) var state: Result<AboutModel> = .idle
    var cancellableSet: Set<AnyCancellable> = []
    let getAboutInteractor : GetAboutInteractor
    
    init(getAboutInteractor: GetAboutInteractor) {
        self.getAboutInteractor = getAboutInteractor
        loadData()
    }

    func loadData(){
        print("starting ..")
        self.state = .loading
        getAboutInteractor.invoke()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Failed with error \(error)")
                    self.state = .failed
                }
            }, receiveValue: { about in
                print("Data retrieved with size \(about.count), response = \(about)")
                self.state = .success(items: about)
            })
            .store(in: &cancellableSet)
    }
}
