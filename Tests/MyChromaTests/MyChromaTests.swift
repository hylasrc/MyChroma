import Foundation
@testable import MyChroma
import Testing

@Test
func testMyChromaAPI() async {
  var chroma = MyChromaHTTPClient()
  let urlReq = MyChromaAPI.root.asURLRequest()
  let resp = try? await chroma.send(request: urlReq, with: MyChromaRootResponse.self)
  print(resp?.nanosecondHeartbeat)
}
