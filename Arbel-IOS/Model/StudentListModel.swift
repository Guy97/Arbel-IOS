//
//  StudentListModel.swift
//  Arbel-IOS
//
//  Created by Simone on 14/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class StudentListModel: NSObject {

    //    Escaping viene richiamato dopo l'esecuzione della funzione, facendola quindi "vivere più a lungo"
    //    Closure, possiamo passarlo nel codice (abbiamo "assegnato" result a Reports)
    func fetchEvents(complete: @escaping (_ result: [StudentData]) -> ()) {
//        let token = "HERE"
        let url = URL(string: "http://arbel.test/api/user")!
        print("URCA")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImNkYzM2MTExNmMzNjNlMjk0Yjc3ZGIzZjFmNWQ4NGI2MjVmNTAyZjYzOWMwZjU2NzRiMjdhNDY3YzM1OTFkMDAzYWZlMWI0ZGU3NzkyN2VkIn0.eyJhdWQiOiIxIiwianRpIjoiY2RjMzYxMTE2YzM2M2UyOTRiNzdkYjNmMWY1ZDg0YjYyNWY1MDJmNjM5YzBmNTY3NGIyN2E0NjdjMzU5MWQwMDNhZmUxYjRkZTc3OTI3ZWQiLCJpYXQiOjE1NTc4NjY3OTAsIm5iZiI6MTU1Nzg2Njc5MCwiZXhwIjoxNTg5NDg5MTkwLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LiiDUT5TxWCpKWOHKgCWUX9GET9kQscJtac36TLwqAl415XMN0Wloy4T2w_5UkqcTAfLpD9cY4112ArefjFKLMIgv-Vdzfa78FLWRiJB01s9FNhpkdXRuXfgQ-_izDmVHSt1jcmufKvpuvD2yoyrLvlng5T1JyAt7MFXrUsz61tXBGV1yeOp4o4gCTH_rH1YrZNez1tVmrat1HHEMmu8dEWdU6qSZiKLGq1itiaoq4S-Svj2H1syUWIRMc4dvwn952JJ7KoJshoy6B7VjDDZRR4N_7X6jmiJGQWokuk8ryozInhyPYzTFpsP5wZVDGnMhE_7c38fPnV4UcbvbLAsD0u5-9LisPx1OZJcuMFZaLdDBUKoF5sX11bshNBpoJnOU4QFB6YL5fIQMLn_ds3IWGx9Qk8PcFgMOuJuyqNnNSUfhBZIoOBXQptH69dpvKX55zH4NLNKmok2ah6zMJ6vmdKBuLCj2C8gOkba-f5rbrGVmOKDBqIry9Ja9XD7tOsoHgwYU8JJ9V1xI7Tkjzwk1k9CsK8txBLNL8RJCYd5F8zqPaXxdmHq46xe-8c1MJWaQZS2QXZZ37wO1NBhVG4meyp3qmuzxnRoumo-xxDoYj0Q-qoYyQXLDUxLEnkdBYQc6ql3jvRfqnDVkhQsXfg2jIEcT3hUqleE13k3zBpbJvw",
            "Accept": "application/json"
        ]
        print("AHAHAHAH")
        
        Alamofire.request(url, headers: headers).responseJSON{
//        Alamofire.request(url, method: .get).validate().responseJSON
        
            response in
            guard response.error == nil
                else {
                    print("errore")
                    print(response.error!)
                    return
            }
            print("Ci sono, forse")
            //            Se la risposta non è di tipo stringa attiva errore
            guard (response.value as? [String: Any]) != nil
                else {
                    if let error = response.error {
                        print("Merdaccia")
                        print("Errore: \(error)")
                    }
                    return
            }
            print("Thanos")
            //            Do esegue il codice per decodificare json chiedendo risposta dai dati presenti al suo interno. In caso di errore viene passato e "preso" dal catch
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let student = try decoder.decode(Students.self, from: response.data!)
                //                Si mandano i dati recuperati a HistoricalViewController
                Students.studentList = student
                
                let getStudent = student.studentLog
                var filteredStudent = getStudent.map { ($0).name}
                
                
                print(student, "Vai stronzo")
            }

            catch let error {
                print("Decoding error: ", error)
            }

            return
        }
    }
}





