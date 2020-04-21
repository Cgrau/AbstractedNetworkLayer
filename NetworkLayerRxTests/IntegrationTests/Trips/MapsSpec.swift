import XCTest
import RxBlocking
import OHHTTPStubs
@testable import NetworkLayerRx

class MapsSpec: XCTestCase {
  
  private var sut: MapsRepository!
  
  override func setUp() {
    super.setUp()
    sut = resolver.mapsRepository
  }
  
  override func tearDown() {
    sut = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func test_get_trips() {
    givenThoseTrips()
    XCTAssertNoThrow(try sut.getTrips().toBlocking().single())
  }
}

extension MapsSpec {
  private func givenThoseTrips() {
    stub(condition: pathMatches("api/trips")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("Trips.ok"),
                                 statusCode: 200,
                                 headers: nil
      )
    }
  }
}
