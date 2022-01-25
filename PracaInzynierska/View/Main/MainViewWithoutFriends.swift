import SwiftUI

struct MainViewWithoutFriends: View {
    @Binding var selectedItem: Int
    @State public var results: [TrainingCellData]
    
    var body: some View {
        List {
            ForEach(results) { trainingCellData in
                MainViewCell(person: trainingCellData)
            }
        }
    }
}
