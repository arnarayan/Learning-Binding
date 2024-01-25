//
//  SettingsRowView.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-18.
//

import SwiftUI

struct SettingsRowView: View {
    var imageName: String
    var title: String
    @Binding var isOn: Bool
    var body: some View {
        VStack {
            
            Toggle(isOn: $isOn) {
                HStack {
                    Image(systemName: imageName)
                        .resizable().frame(width: 28, height: 28)
                        .foregroundColor(.blue)
                    Text(title).font(.subheadline)
                    
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}


