//
//  OnboardingView.swift
//  ConnectedSample
//
//  Created by 김다빈 on 2023/06/04.
//

import SwiftUI
import Combine

extension String {
    func containEnglish() -> Bool {
        let englishRange = self.range(of: "[a-zA-Z]", options: .regularExpression)
        return englishRange != nil
    }
}

struct OnboardingView: View {
    let maxCharacterLength = Int(8)
    @State var name: String = ""
    var body: some View {
        TabView{
            VStack{
                SkipButton()
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 324,height: 324)
                Text("사용방법 설명은 여기에 합니다. 최대한 간략하게\n 설명합니다. 두 줄 까지만 적혔으면 좋겠습니다.")
                OnboardingButton(contentButton: "다음")
            }
            VStack{
                SkipButton()
                Text("별명을 짓는 페이지입니다. 이런 식으로\n 글이 작성될 예정입니다.")
                HStack(spacing: 0){
                    TextField("이름을 알려주세요", text: $name)
                        .foregroundColor(.black)
                        .underline()
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 20))
                        .background(Color.gray)
                        .cornerRadius(50)
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .onReceive(Just(name), perform: { _ in
                            if maxCharacterLength < name.count {
                                name = String(name.prefix(maxCharacterLength))
                            }
                            if name.containEnglish() == true {
                                name = String(name.dropLast())
                            }
                            
                        })
                }
                OnboardingButton(contentButton: "다음")
            }
            VStack{
                Image(systemName: "globe")
                HStack{
                    Text(name)
                    Text("님 \n같이 시작해봐요!")
                }
                CustomProgressbar()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear
        {
            setupAppearance()
        }
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
