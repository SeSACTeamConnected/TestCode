//
//  OnboardingButton.swift
//  ConnectedSample
//
//  Created by 김다빈 on 2023/06/04.
//

import SwiftUI

struct OnboardingButton: View {
    var contentButton : String
    var body: some View {
        HStack{
            Button {
                print("Hello")
            } label: {
                Text(contentButton)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
            }
            .background(.gray)
            .cornerRadius(100)
            .padding(.leading,20)
            .padding(.trailing,20)

        }
    }
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton(contentButton: "다음")
    }
}
