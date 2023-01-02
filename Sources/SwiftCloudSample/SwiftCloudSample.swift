import Foundation
import Compute

@available(iOS 13.0.0, *)
@main
public struct SwiftCloudSample {

    static let router = Router()
        .get("") { req, res in
            try await res
                .status(.ok)
                .send("Hello, World!")
        }
        .get("/check") { req, res in
            try await res
                .status(.ok)
                .send(req.body)
        }
        .get("/greeting") { req, res in
            let jsonBody = try await req.body.jsonObject()
            let name = jsonBody["name"] as? String ?? ""
            let result = "Hello, \(name)!"
            let resultJson = [
                "greeting": result
            ]
            let resultData = try JSONEncoder().encode(resultJson)
            try await res
                .status(.ok)
                .send(resultData)
        }

    public static func main() async throws {
        //try await onIncomingRequest(handler)
        try await onIncomingRequest(router.run(_:_:))
    }

//    static func handler(req: IncomingRequest, res: OutgoingResponse) async throws {
//        let jsonBody = try await req.body.jsonObject()
//        let name = jsonBody["name"] as? String ?? ""
//        let result = "Hello, \(name)!"
//
//        let resultJson = [
//            "greeting": result
//        ]
//        let resultData = try JSONEncoder().encode(resultJson)
//
//        try await res
//            .status(.ok)
//            .send(result)
////            .send(resultData)
//    }
}
