import UIKit

struct Person {
    let name: String
    
}

typealias JoshuaString = String

var name : JoshuaString = "Joshua"

typealias PersonResponseCompletion = (Bool, Person) -> ()

class PersonApi {
    func getRandomPerson(url: String, completion: @escaping PersonResponseCompletion) {
        // Perform Time consuming network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("Network request completed")
            completion(true, Person(name: "Joshua"))
        }
        
        
    }
}

class VC {
    
    let personApi = PersonApi()
    
    func randomButtonPressed() {
        print("About to start request")

        
        personApi.getRandomPerson(url: "url") { (success, person) in
            if success {
                print(person.name)
            }
        
        }
        print("Network request has started")

    }
}

let vc = VC()

vc.randomButtonPressed()
