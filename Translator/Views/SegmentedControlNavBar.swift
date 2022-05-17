//
//  SegmentedControlNavBar.swift
//
//  Navigation bar with a segmented control in SwiftUI.
//
//  Created by Magnus W. Solbakken on 18/05/2020.
//  Copyright © 2020 Magnus W. Solbakken.
//
import SwiftUI
import UIKit

let screenSize = UIScreen.main.bounds

struct SegmentedControlNavBarDemoView: View {
    let screenWidth = screenSize.width
    let navBarColor = Color.white
    var sections = ["first", "second", "third"]
    
    @State private var sectionIndex = 0

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundEffect = .none
        appearance.backgroundColor = UIColor.clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        // Navigation View
        NavigationView {
            ZStack {
                // Content View
                Group {
                    ZStack {
                        Color.accentColor.edgesIgnoringSafeArea(.all)
                        Text(currentSection()).foregroundColor(Color.white).bold()
                    }
                }
                    
                // Navigation Bar
                .navigationBarTitle("Navbar with picker", displayMode: .inline)
                
                // Segmented picker
                Group {
                    ZStack {
                        VStack {
                            Rectangle()
                                .fill(navBarColor)
                                .frame(width: screenWidth, height: 138)
                            Spacer()
                        }
                        .edgesIgnoringSafeArea(.all)
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: screenWidth, height: 50)
                                Section {
                                    SegmentControlView()
                                }.padding(.horizontal, 10)
                            }
                            Spacer()
                        }
                    }
                }

            }
        }
    }
    
    // Demo content
    func currentSection()-> String {
        switch sectionIndex {
            case 0:
                return "FIRST SECTION"
            case 1:
                return "SECOND SECTION"
            case 2:
                return "THIRD SECTION"
            default:
                return "DEFAULT SECTION"
        }
    }
}

struct SegmentedControlNavBarDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlNavBarDemoView()
    }
}
