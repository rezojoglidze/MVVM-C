//
//  LoginViewModelTest.swift
//  MVVM-C ProjectTests
//
//  Created by Rezo Joglidze on 03.03.22.
//

import XCTest
@testable import MVVM_C_Project

class LoginViewModelTest: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    var loginViewController: LoginViewController!
    var authCoordinator: AuthCoordinator!
    
    override func setUp() {
        super.setUp()
        loginViewController = LoginViewController.instantiate()
        authCoordinator = AuthCoordinator(navigationController: UINavigationController())
        // Initialize Profile View Model
        loginViewModel = LoginViewModel(view: loginViewController, coordinator: authCoordinator)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // prepare mocks for view and coordinator: classes that implement corresponding protocols and count methods calls
    }
    
    func test_LoginViewModelInitialization() {
        XCTAssertNotNil(loginViewModel, "The login view model should not be nil.")
        XCTAssertTrue(loginViewModel.view === loginViewController, "The view should be equal to the view that was passed in.")
    }
    
    func test_IsValidEmailShouldReturnFalseForIncorrectEmails() {
        let invalidEmail1 = "123@abc"
        loginViewModel.email = invalidEmail1
        let result1 = loginViewModel.isValidEmail()
        XCTAssertFalse(result1, "Positive result for invalid email")
        
        let invalidEmail2 = "abc.ru"
        loginViewModel.email = invalidEmail2
        let result2 = loginViewModel.isValidEmail()
        XCTAssertFalse(result2, "Positive result for invalid email")
    }
    
    func test_IsValidEmailShouldReturnTrueForCorrectEmails() {
        let validEmail1 = "1a2b3c@abc.com"
        loginViewModel.email = validEmail1
        let result1 = loginViewModel.isValidEmail()
        XCTAssertTrue(result1, "Negative result for valid email")
        
        let validEmail2 = "test2_a@test.ru"
        loginViewModel.email = validEmail2
        let result2 = loginViewModel.isValidEmail()
        XCTAssertTrue(result2, "Negative result for valid email")
    }
    
    func test_CheckValidPasswordShouldReturnCorrectWarningForShortPassword() {
        let shortPassword = "abc12"
        loginViewModel.password = shortPassword
        let result = loginViewModel.isValidPassword()
        XCTAssertEqual(result,
                       "Password must not be shorter than 6 characters",
                       "Incorrect result for short password")
    }
    
    func test_CheckValidPasswordShouldReturnCorrectWarningForUppercaselessPass() {
        let uppercaselessPass = "abcdef"
        loginViewModel.password = uppercaselessPass
        let result = loginViewModel.isValidPassword()
        XCTAssertEqual(result,
                       "Password must contain at least one uppercase letter",
                       "Incorrect result for password without upeprcase")
    }
    
    func test_CheckValidPasswordShouldReturnCorrectWarningForLowercaselessPass() {
        let lowercaselessPass = "PASSWORD"
        loginViewModel.password = lowercaselessPass
        let result = loginViewModel.isValidPassword()
        XCTAssertEqual(result,
                       "Password must contain at least one lowercase letter",
                       "Incorrect result for password without lowercase")
    }
    
    func test_CheckValidPasswordShouldReturnCorrectWarningForNumberslessPass() {
        let numberslessPass = "Password"
        loginViewModel.password = numberslessPass
        let result = loginViewModel.isValidPassword()
        XCTAssertEqual(result,
                       "Password must contain at least one number",
                       "Incorrect result for password without numbers")
    }
    
    func test_CheckValidPasswordShouldReturnNilForCorrectPassword() {
        let validPassword1 = "Abcd11"
        loginViewModel.password = validPassword1
        let result1 = loginViewModel.isValidPassword()
        XCTAssertNil(result1, "Incorrect result for correct password")
        
        let validPassword2 = "Password01"
        loginViewModel.password = validPassword2
        let result2 = loginViewModel.isValidPassword()
        XCTAssertNil(result2, "Incorrect result for correct password")
    }
    
}
