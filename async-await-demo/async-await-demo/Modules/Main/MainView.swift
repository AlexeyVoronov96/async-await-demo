//
//  ContentView.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainViewConfigurator.configure()
    }
}
