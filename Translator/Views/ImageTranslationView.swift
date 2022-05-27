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
                // Background for header
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
                
                // Image input
                ZStack {
                    image?
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }
                    .frame(maxWidth: .infinity, maxHeight: ContentView.screenHeight * 0.25, alignment: .center)
                    .padding(.horizontal)
                
                // Image section
                Label("Select Image", systemImage: "photo.on.rectangle.angled")
                    .onTapGesture {
                        showImagePicker = true
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(image: $inputImage)
                    }
                
                Divider()
                
                // Text output
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
                
                // Language selection and translation functionalaity
                LanguageTranslationView(input: $inputText, output: $translatedText)
                
                // Background for footer
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
            }
            // Border styling for header and footer
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(.secondary.opacity(0.1)), alignment: .top)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(.secondary.opacity(0.1)), alignment: .bottom)
            .navigationTitle("Image Translation")
            .onChange(of: inputImage) { _ in loadImage() }  // Load and recognise text in image when an image is input
        }
    }
    
    // Load and recognise text in image
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        // Recognise text
        let textRecognizer = TextRecognizer.textRecognizer(options: TextRecognizerOptions())
        let visionImage = VisionImage(image: inputImage)
        visionImage.orientation = inputImage.imageOrientation
        textRecognizer.process(visionImage) { result, error in guard error == nil, let result = result else { return }
                inputText = result.text // Return text from image
        }
    }
}

//struct ImageTranslationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageTranslationView()
//    }
//}
