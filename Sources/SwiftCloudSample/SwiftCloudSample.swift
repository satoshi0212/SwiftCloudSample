import Compute

@available(iOS 13.0.0, *)
@main
public struct SwiftCloudSample {
    public private(set) static var text = "Hello, World!!"

    public static func main() async throws {
        try await onIncomingRequest(handler)
    }

    static func handler(req: IncomingRequest, res: OutgoingResponse) async throws {
        try await res
            .status(.ok)
            .send(text)
    }
}
