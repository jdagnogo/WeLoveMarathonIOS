//
//  TipsUIView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 20/07/2023.
//

import SwiftUI

struct TipsUIView: View {
    @ObservedObject var viewModel: TipsViewModel
    
    var body: some View {
        let state = viewModel.state
        switch state {
        case .idle :
            Color.clear.onAppear(perform: viewModel.loadData)
        case .success(let tips):
            List(tips) { tips in
                         VStack(alignment: .leading){
                             Text("\(tips.title)")
                             Text("\(tips.description)")
                         }
                     }
            
        default:
            Text("Loading")
        }
        
    }
}

struct TipsUIView_Previews: PreviewProvider {
    static var previews: some View {
        TipsUIView(viewModel: TipsViewModel(getTipsInteractor: GetTipsInteractorImpl(repository: TipsRepositoryProtocolImpl(service: TipsServiceImpl(), local: TipsLocalData(), dataFreshnessRepository: DataFreshnessRepositoryImpl()))))
    }
}
