//
//  SkipButton.swift
//  ConnectedSample
//
//  Created by 김다빈 on 2023/06/04.
//

import SwiftUI

struct SkipButton: View {
    var body: some View {
        HStack(){
            Button {
                print("skip")
            } label: {
                Text("Skip")
                    .foregroundColor(Color.black)
                    .frame(alignment: .trailing)
            }
            .frame(alignment: .trailing)

        }
        .frame(maxWidth: .infinity)
    }
}

struct SkipButton_Previews: PreviewProvider {
    static var previews: some View {
        SkipButton()
    }
}
