import XCTest
import RxBlocking
import OHHTTPStubs
@testable import NetworkLayerRx

class DummySpec: XCTestCase {
  
  private var sut: DummyRepository!
  
  override func setUp() {
    super.setUp()
    sut = resolver.repository
  }
  
  override func tearDown() {
    sut = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func test_dummy() {
    givenThatDummy()
    let request = DummyRequest(firstName: "", lastName: "")
    XCTAssertNoThrow(try sut.getDummy(request: request).toBlocking().single())
  }
}

extension DummySpec {
  private func givenThatDummy() {
    stub(condition: pathMatches("/dummy/service")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("dummy.ok"),
                                 statusCode: 200,
                                 headers: nil
      )
    }
  }
}
