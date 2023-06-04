//
//  ContentView.swift
//  ConnectedSample
//
//  Created by 김다빈 on 2023/06/04.
//

import SwiftUI

struct ContentView: View {
    @State private var introIndex = 0
    @State private var isNextView = false
    let intro : [String] = ["안녕하세요,\n여기는 토리의 숲이에요","마법이 있어야만\n자랄 수 있어요"]
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                   SkipButton()
                HStack{
                    Text(intro[introIndex])
                        .font(.system(size: 20))
                        .frame(alignment: .center)
                    
                }
                .frame(maxWidth: .infinity)
                
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 219,height: 249)
                
                
            }
            .onAppear{
                if(introIndex == 0){
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                        withAnimation(.linear(duration: 0.5)){
                            self.introIndex += 1
                        }
                        
                    }
                }
                else if(introIndex == 1){
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                        
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
