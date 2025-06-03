

import XCTest
@testable import TodoApp

final class AuthServiceTests: XCTestCase {
    
    var authService: AuthService!
    
    override func setUp() {
        super.setUp()
        authService = AuthService()
    }
    
    func testLogin_withInvalidCredentials_returnsError() async {
        let (token, error) = await authService.login(userIdentifier: "wrongUser", password: "wrongPass")
        XCTAssertEqual(token, "")
        XCTAssertNotNil(error)
    }
    
    func testRegister_withInvalidData_returnsError() async {
        let (token, error) = await authService.register(username: "", email: "invalidemail", password: "123")
        XCTAssertEqual(token, "")
        XCTAssertNotNil(error)
    }
    
    func testVerifyToken_withInvalidToken_returnsError() async {
        let error = await authService.verifyToken(token: "invalid.token.value")
        XCTAssertNotNil(error)
    }
    
    func testRefresh_alwaysReturnsError() {
        let (token, error) = authService.refresh(token: "anytoken")
        XCTAssertEqual(token, "")
        XCTAssertEqual(error, "An error occured attempting to refresh")
    }
}

