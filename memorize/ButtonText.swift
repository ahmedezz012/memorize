//
//  ButtonText.swift
//  memorize
//
//  Created by Ahmed Ezz on 20/01/2023.
//

import SwiftUI

struct ButtonText: View
{
    var imageId : String
    var text : String
    
    var isSelected: Bool = false
    
    var body: some View {
        if isSelected {
         selectedStyle
        }
        else {
         nonSelectedStyle
        }
    }
    
    var selectedStyle : some View {
        VStack {
            Image(systemName: imageId).foregroundColor(Color.red)
            Text(text).fontWeight(.bold).foregroundColor(Color.red)
         }
    }
    
    var nonSelectedStyle : some View {
        VStack {
            Image(systemName: imageId).foregroundColor(Color.black)
            Text(text).foregroundColor(Color.black)
         }
    }
}
