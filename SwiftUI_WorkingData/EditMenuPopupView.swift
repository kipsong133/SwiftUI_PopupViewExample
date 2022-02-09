//
//  EditMenuPopupView.swift
//  SwiftUI_WorkingData
//
//  Created by 김우성 on 2022/02/09.
//

import SwiftUI

struct EditMenuPopupView: View {
    
    @Binding var food: Food
    @Binding var id: UUID!
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("메뉴를 수정하세요.")
                .font(.largeTitle)
            
            TextField("메뉴명", text: $food.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("가격", text: $food.price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("완료") {
                id = nil
            }
            
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.background)
                .shadow(radius: 8)
            
        }
        .padding(24)
    }
}

struct EditMenuPopupView_Previews: PreviewProvider {
    static var previews: some View {
        EditMenuPopupView(food: .constant(Food(name: "신선로", price: "24000")), id: .constant(UUID()))
    }
}
