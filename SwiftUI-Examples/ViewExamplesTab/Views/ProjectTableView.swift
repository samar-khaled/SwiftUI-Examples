//
//  ProjectTableView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 21/03/2025.
//
import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    let appName: String
    let developmentHours: Int
    let frameworkNumbers: String
    let downloads: String
    let revenue: Double
}

struct ProjectTableView: View {
    @State var projects = [
        Project(appName: "Procrastinatr", developmentHours: 250, frameworkNumbers: "5", downloads: "1M", revenue: 150000.0),
        Project(appName: "FitTrack", developmentHours: 183, frameworkNumbers: "3", downloads: "500K", revenue: 95000.0),
        Project(appName: "EduLearn", developmentHours: 70, frameworkNumbers: "7", downloads: "2M", revenue: 250000.0),
        Project(appName: "GameZone", developmentHours: 217, frameworkNumbers: "10", downloads: "10M", revenue: 1000000.0),
        Project(appName: "DietCheatr", developmentHours: 92, frameworkNumbers: "4", downloads: "750K", revenue: 175000.0)
    ]

    @State var selectionData: Project.ID? = nil
    @State private var sortOrder = [KeyPathComparator(\Project.downloads)]

    var body: some View {
        Table(of: Project.self, selection: $selectionData, sortOrder: $sortOrder) {
            TableColumn("App Name", value: \.appName)

            TableColumn("Development Hours") { app in
                Text("\(app.developmentHours)")
            }

            TableColumn("Framework Numbers", value: \.frameworkNumbers)
            TableColumn("Downloads", value: \.downloads)

            TableColumn("Revenue") { app in
                Text("$\(app.revenue, specifier: "%.2f")")
            }
        } rows: {
            ForEach(projects) { project in
                TableRow(project)
            }
        }
        .onChange(of: sortOrder) { _, sortOrder in
            projects.sort(using: sortOrder)
        }
    }
}

#Preview {
    ProjectTableView()
}
