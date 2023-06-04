//
//  SampleModal.swift
//  ConnectedSample
//
//  Created by 김다빈 on 2023/06/05.
//

import SwiftUI

struct SampleModal: View {
    @Binding var isPresented: Bool
    @State private var imageDiscription : String =  ""
    @State private var isShowingImagePicker = false
     @State private var isShowingActionSheet = false
     @State private var selectedImage: UIImage?

     var body: some View {
         RoundedRectangle(cornerRadius: 20)
             .foregroundColor(.gray)
             .frame(maxWidth: .infinity)
             .frame(height: 513)
             .overlay(
             VStack {
                 HStack{
                     Button(action: {
                         // 모달 뷰를 닫고 일지를 저장하는 로직을 구현합니다.
                         isPresented = false
                     }) {
                         Text("저장")
                             .padding()
                             .background(Color.blue)
                             .foregroundColor(.white)
                             .cornerRadius(10)
                     }
                     Button(action: {
                         // 모달 뷰를 닫고 일지를 저장하는 로직을 구현합니다.
                         isPresented = false
                     }) {
                         Text("나가기")
                             .padding()
                             .background(Color.blue)
                             .foregroundColor(.white)
                             .cornerRadius(10)
                     }
                 }
                 Button(action: {
                     isShowingActionSheet = true
                 }) {
                     if let image = selectedImage {
                         Image(uiImage: image)
                             .resizable()
                             .frame(maxWidth: .infinity)
                             .frame(height: 187)
                             .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                     } else {
                         RoundedRectangle(cornerRadius: 20)
                             .frame(maxWidth: .infinity)
                             .frame(height: 187)
                             .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                             .foregroundColor(Color.white)
                             .overlay(
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                             )
                     }
                 }
                 .actionSheet(isPresented: $isShowingActionSheet) {
                     ActionSheet(title: Text("이미지 선택"), message: nil, buttons: [
                        .default(Text("사진 찍기"), action: {
                            isShowingImagePicker = true
                        }),
                        .default(Text("이미지 선택"), action: {
                            isShowingImagePicker = true
                        }),
                        .cancel()
                     ])
                 }
                 .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                     ImagePicker(selectedImage: $selectedImage, sourceType: .camera)
                 }
                 HStack{
                     TextField("Placeholder",text: $imageDiscription)
                         .frame(height: 224)
                         .frame(maxWidth: .infinity)
                         .background(Color.white)
                         .cornerRadius(20)
                 }
                 .padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17))
                 
             }
             )
         }
     }

     func loadImage() {
         // 이미지 선택 또는 사진 촬영 완료 후 호출되는 함수
         // 선택된 이미지를 처리하는 로직을 구현할 수 있습니다.
     }


 struct ImagePicker: UIViewControllerRepresentable {
     @Binding var selectedImage: UIImage?
     var sourceType: UIImagePickerController.SourceType = .photoLibrary

     func makeCoordinator() -> Coordinator {
         Coordinator(parent: self)
     }

     func makeUIViewController(context: Context) -> UIImagePickerController {
         let imagePickerController = UIImagePickerController()
         imagePickerController.delegate = context.coordinator
         imagePickerController.sourceType = sourceType
         return imagePickerController
     }

     func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

     class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
         let parent: ImagePicker

         init(parent: ImagePicker) {
             self.parent = parent
         }

         func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
             if let selectedImage = info[.originalImage] as? UIImage {
                 parent.selectedImage = selectedImage
             }
             picker.dismiss(animated: true, completion: nil)
         }
     }
 }
