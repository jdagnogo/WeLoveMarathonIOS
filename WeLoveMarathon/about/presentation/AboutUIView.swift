//
//  AboutUIView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import SwiftUI

struct AboutUIView: View {
    @ObservedObject var viewModel: AboutViewModel
    
    var body: some View {
        let state = viewModel.state
        switch state {
        case .idle :
            Color.clear.onAppear(perform: viewModel.loadData)
        case .success(let abouts):
            VStack{
                ForEach(abouts, id: \.self) { about in
                    Text(about.mail)
                    ForEach(about.members, id: \.self) { member in    Text(member.name)
                    }
        
                }
            }
        default:
            ProgressView()
        }
    }
}

struct AboutUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUIView(viewModel: AboutViewModel(getAboutInteractor: GetAboutInteractorImpl(repository: AboutRepositoryProtocolImpl(service: AboutServiceImpl(), local: AboutLocalData(), dataFreshnessRepository: DataFreshnessRepositoryImpl()))))
    }
}
