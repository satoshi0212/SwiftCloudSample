import Foundation
import Compute

@available(iOS 13.0.0, *)
@main
public struct SwiftCloudSample {
    public private(set) static var text = "Hello, World!!"

    public static func main() async throws {
        try await onIncomingRequest(handler)
    }

    static func handler(req: IncomingRequest, res: OutgoingResponse) async throws {
        let jsonBody = try await req.body.jsonObject()
        let name = jsonBody["name"] as? String ?? ""
        let result = "Hello, \(name)!"

//        let resultJson = [
//            "greeting": result,
//        ]
//        let resultData = try JSONEncoder().encode(resultJson)

        try await res
            .status(.ok)
            .send(result)
//            .send(resultData)
    }
}
