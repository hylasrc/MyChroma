import Foundation
@testable import MyChroma
import Testing

@Test
func testMyChromaAPI() async {
  var chroma = MyChroma("http://localhost:8000")
  let collId = "606c92ad-49bf-4616-ae48-f08d27041965"
  do {
    // let id = collections.first!.id
    // try print(await chroma.createCollection(.init(tenant: "default_tenant", database: "default_database", name: "testCollection", configuration: [:], metadata: ["1": "2"], getOrCreate: false)))
    // try print(await chroma.count(.init(collectionId: id)))
    // try await print(chroma.countCollections(.init(tenant: "default_tenant", database: "default_database")))
    // try print(await chroma.getCollection(.init(collectionName: "testCollection", tenant: "default_tenant", database: "default_database")))
    let collections = try await chroma.listCollections(.init(tenant: "default_tenant", database: "default_database", offset: 0, limit: 100))
    print(collections)
    try print(await chroma.updateCollection(.init(collectionId: collId, newName: "testCollection", newMetadata: ["1": "2"])))
    print("end")
  } catch {
    print(error.localizedDescription)
    if let error = error as? URLError {
      print(error.userInfo)
    }
  }
}
