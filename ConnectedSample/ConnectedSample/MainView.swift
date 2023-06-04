//
//  MainView.swift
//  ConnectedSample
//
//  Created by 김다빈 on 2023/06/05.
//

import SwiftUI

struct MainView: View {
    @State private var isModalPresented = false
    var body: some View {
        Button {
            isModalPresented = true
        } label: {
            Text("일지 입력하기")
        }
        .sheet(isPresented: $isModalPresented) {
            SampleModal(isPresented: $isModalPresented)
            
        }
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
