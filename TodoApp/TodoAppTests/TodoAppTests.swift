import XCTest
@testable import TodoApp

final class FormValidationTests: XCTestCase {
    
    func testValidUsername() {
        let form = RegisterForm()
        form.username = "validUser123"
        XCTAssertNil(form.verifyUsername())
    }
    
    func testInvalidUsernameTooShort() {
        let form = RegisterForm()
        form.username = "ab"
        XCTAssertEqual(form.verifyUsername(), "Username mus tbe at least 3 characters long.")
    }
    
    func testInvalidUsernameCharacters() {
        let form = RegisterForm()
        form.username = "!!!"
        XCTAssertEqual(form.verifyUsername(), "Invalid username. Must contain at least one letter and can include letters, numbers, periods, underscores, and dashes. Special characters must be followed by a letter or number.")
    }
    
    func testValidPassword() {
        let form = RegisterForm()
        form.password = "Abcdef1!"
        XCTAssertNil(form.verifyPassword())
    }
    
    func testInvalidPasswordTooShort() {
        let form = RegisterForm()
        form.password = "Ab1!"
        XCTAssertEqual(form.verifyPassword(), "Password must be 8 characters long")
    }
    
    func testInvalidPasswordFormat() {
        let form = RegisterForm()
        form.password = "abcdefgh"
        XCTAssertEqual(form.verifyPassword(), "Invalid password. Must contain one uppercase and lowercase character, a number, and special character such as (!@#$%^&*)")
    }
    
    func testValidEmail() {
        let form = RegisterForm()
        form.email = "test@example.com"
        XCTAssertNil(form.verifyEmail())
    }
    
    func testInvalidEmail() {
        let form = RegisterForm()
        form.email = "invalid-email"
        XCTAssertEqual(form.verifyEmail(), "Invalid email. Use a valid email or try another one")
    }
}
