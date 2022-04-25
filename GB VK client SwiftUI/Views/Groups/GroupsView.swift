//
//  GroupsView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI

struct GroupsView: View {
    @ObservedObject var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.groups) { group in
            GroupsRow(group: group)
        }
        .navigationTitle("Группы")
        .onAppear {
            viewModel.fetch()
        }
        .listStyle(.plain)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupsView(viewModel: GroupViewModel())
        }
    }
}
