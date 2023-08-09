//
//  TipsUIView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 20/07/2023.
//

import SwiftUI

struct TipsUIView: View {
    @ObservedObject var viewModel: TipsViewModel
    @State private var showSheet = false
    @State private var tipSelected : Tips? = nil
    
    var body: some View {
        let state = viewModel.state
        switch state {
        case .idle :
            Color.clear.onAppear(perform: viewModel.loadData)
        case .success(let tips):
            NavigationStack {
                ScrollView {
                    ScrollView(.vertical) {
                        let columns = Array(repeating: GridItem(.flexible(minimum: 100), spacing: 20), count: 2)
                        LazyVGrid(
                            columns: columns,
                            alignment: .center,
                            spacing: 16
                        ) {
                            ForEach(tips, id: \.self) { tip in
                                TipsUIItem(color: tip.color, iconPath: tip.icon, name: tip.title,onClick: {
                                    tipSelected = tip
                                    showSheet = true
                                })
                            }
                        }.padding()
                        
                    }
                }.background(Color("Primary")).navigationTitle("Tips")
                    .sheet(isPresented: Binding(
                        get: { showSheet },
                        set: { showSheet = $0 }
                    )) {
                        if let title = tipSelected?.title {
                            TipsModelUiView(title: title, description: tipSelected?.description ?? "")
                        }
                    }
            }
            
        default:
            ProgressView()
        }
        
    }
}

struct TipsUIView_Previews: PreviewProvider {
    static var previews: some View {
        TipsUIView(viewModel: TipsViewModel(getTipsInteractor: GetTipsInteractorImpl(repository: TipsRepositoryProtocolImpl(service: TipsServiceImpl(), local: TipsLocalData(), dataFreshnessRepository: DataFreshnessRepositoryImpl()))))
    }
}
