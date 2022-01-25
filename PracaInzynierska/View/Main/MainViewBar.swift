import SwiftUI

struct MainViewBar: View {
    @Binding var selectedItem: Int
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.selectedItem = 0
                }, label: {
                    Image(systemName: "person.fill")
                        .foregroundColor(selectedItem == 0 ? Colors().secondColor : Colors().mainColor)
                })
                Button(action: {
                    self.selectedItem = 1
                }, label: {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(selectedItem == 1 ? Colors().secondColor : Colors().mainColor)
                })
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 30)
    }
}
