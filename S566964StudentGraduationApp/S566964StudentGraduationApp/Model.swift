import Foundation

struct Student{
    var firstName: String
    var lastName: String
    var isUndergrad: Bool
    var creditHoursEarned: Int
    
    init(firstName: String, lastName: String, isUndergrad: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.isUndergrad = isUndergrad
        self.creditHoursEarned = if isUndergrad{
            Int.random(in: 0...120)
        }else {
            Int.random(in: 0...33)
        }
    }
}

struct DataManager {
    static let sharedDataManager = DataManager()
    
    private let students = [
        "undergrad" : [
            Student(firstName: "Emily", lastName: "Johnson", isUndergrad: true),
            Student(firstName: "Alexander", lastName: "Smith", isUndergrad: true),
            Student(firstName: "Sophia", lastName: "Williams", isUndergrad: true),
            Student(firstName: "William", lastName: "Brown", isUndergrad: true),
            Student(firstName: "Olivia", lastName: "Jones", isUndergrad: true)
        ],
        "grad" : [
            Student(firstName: "John", lastName: "Smith", isUndergrad: false),
            Student(firstName: "Benjamin", lastName: "Davis", isUndergrad: false),
            Student(firstName: "Iva", lastName: "Martinez", isUndergrad: false),
            Student(firstName: "Ethan", lastName: "Wilson", isUndergrad: false),
            Student(firstName: "Mia", lastName: "Taylor", isUndergrad: false)
        ]
    ]
    
    func fetchStudents() -> [String: [Student]] {
        self.students
    }
}
