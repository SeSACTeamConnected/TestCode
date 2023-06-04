//
//  CustomProgressbar.swift
//  ConnectedSample
//
//  Created by 김다빈 on 2023/06/04.
//

import SwiftUI

struct CustomProgressbar: View {
    @State private var progress: CGFloat = 0.0

       var body: some View {
           VStack{
               ZStack {
                   RoundedRectangle(cornerRadius: 20)
                       .frame(width: 150, height: 80)
                       .foregroundColor(Color("Sample"))
                   RoundedRectangle(cornerRadius: 20)
                       .frame(width: 150, height: 80)
                       .foregroundColor(Color.blue)
                       .scaleEffect(x: progress, y: 1.0, anchor: .leading)
                       .animation(.linear(duration: 1.0))
                   Text("샘플")
                       .foregroundColor(.black)
               }
            
                   
               
               Button(action: {
                   withAnimation {
                       progress = progress < 1.0 ? 1.0 : 0.0 // 버튼을 누를 때마다 프로그래스 바가 채워지거나 비워지도록 함
                   }
               }) {
                   Text("Animate")
               }
           }
       }
   }

struct CustomProgressbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressbar()
    }
}
