//
//  ImageTranslationView.swift
//  Translator
//
//  Created by Nathan Shaheen on 24/5/2022.
//

import SwiftUI

import MLKitTextRecognition
import MLKitVision

struct ImageTranslationView: View {
    @State var inputText = ""
    @State var translatedText = ""
    
    @State var image: Image?
    @State var showImagePicker = false
    @State var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
                
                ZStack {
                    image?
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }
                    .frame(maxWidth: .infinity, maxHeight: ContentView.screenHeight * 0.25, alignment: .center)
                    .padding(.horizontal)
                
                Label("Select Image", systemImage: "photo.on.rectangle.angled")
                    .onTapGesture {
                        showImagePicker = true
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(image: $inputImage)
                    }
                
                Divider()
                
                ScrollView {
                    Text(translatedText)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(5)
                }
                    .frame(maxWidth: .infinity, maxHeight: ContentView.screenHeight * 0.25, alignment: .topLeading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding()
                
                Spacer()
                
                LanguageTranslationView(input: $inputText, output: $translatedText)
                
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
            }
            .navigationTitle("Image Translation")
            .onChange(of: inputImage) { _ in loadImage() }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        let textRecognizer = TextRecognizer.textRecognizer(options: TextRecognizerOptions())
        let visionImage = VisionImage(image: inputImage)
        visionImage.orientation = inputImage.imageOrientation
        textRecognizer.process(visionImage) { result, error in guard error == nil, let result = result else { return }
                inputText = result.text
        }
    }
}

//struct ImageTranslationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageTranslationView()
//    }
//}
