//
//  DemoView.swift
//  OYO
//
//  Created by Vishwa  R on 22/12/21.
//

import SwiftUI



struct DemoView: View {
    
    @SceneStorage("Scene") var text = ""
        
    var body: some View {
        
        NavigationView {
            TextEditor(text: $text)
        }.navigationViewStyle(.stack)
        
    }
    
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}

