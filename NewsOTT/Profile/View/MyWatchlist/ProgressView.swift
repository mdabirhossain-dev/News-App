//
//  ProgressView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import SwiftUI

struct ProgressViewData: View {
    let progressPercentasge: Double
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: geo.size.width, height: 6/852 * geo.size.width)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: progressPercentasge * geo.size.width, height: 8/geo.size.height)
            }
        }
    }
}

// MARK: - Preview
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewData(progressPercentasge: 0.5)
    }
}
