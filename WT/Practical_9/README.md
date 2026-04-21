# Practical 9: Registration and Login Application using AngularJS

## Overview
This practical demonstrates the development of a Registration and Login application using AngularJS, showcasing key concepts such as MVC architecture, two-way data binding, form validation, and controller management.

## Files Included
1. **index.html** - Main HTML file containing the user interface
2. **script.js** - AngularJS controller and application logic
3. **style.css** - Professional styling and responsive design
4. **ASSIGNMENT.md** - Complete academic assignment document
5. **README.md** - This file

## How to Run
1. Open `index.html` in any modern web browser
2. No server or installation required (runs completely on client-side)
3. The application uses AngularJS CDN for framework dependencies

## Features Demonstrated

### 1. AngularJS Directives Used
- **ng-app** - Bootstraps the AngularJS application
- **ng-controller** - Attaches the AuthController to the view
- **ng-model** - Two-way data binding for form fields
- **ng-submit** - Handles form submission
- **ng-show/ng-hide** - Conditional rendering of forms
- **ng-click** - Button click event handling
- **ng-repeat** - Displays registered users in a table
- **ng-pattern** - Validates input patterns
- **ng-minlength/ng-maxlength** - Validates input length
- **ng-class** - Dynamic CSS class binding
- **ng-style** - Dynamic inline styles
- **ng-disabled** - Disables buttons based on form state

### 2. Form Validation
- **Real-time validation** of all form fields
- **Password strength indicator** with visual feedback
- **Username uniqueness check** against registered users
- **Email format validation**
- **Password confirmation matching**
- **Minimum/Maximum length constraints**
- **Pattern matching** for names (letters only)

### 3. Key Features
- **Registration Module**: Collect user information with comprehensive validation
- **Login Module**: Authenticate users against registered database
- **Session Management**: Uses localStorage to persist login sessions
- **Toggle Interface**: Easy switching between Login and Register modes
- **User Feedback**: Success/error messages with animations
- **User Directory**: Displays all registered users in a table format
- **Responsive Design**: Works seamlessly on desktop and mobile devices

## Application Workflow

### Registration Process
1. User clicks the "Register" button
2. Fills in all required fields (First Name, Last Name, Username, Email, Password, Confirm Password)
3. Real-time validation provides instant feedback
4. Password strength indicator shows security level
5. Upon successful registration:
   - User is added to the registered users list
   - Success message is displayed
   - Application automatically switches to login mode after 2 seconds

### Login Process
1. User clicks the "Login" button
2. Enters username/email and password
3. Application verifies credentials against registered users
4. Upon successful login:
   - User is authenticated
   - Welcome message displays with user's name
   - Logout button appears
   - Session is saved in localStorage

## Technical Implementation

### Controller Functions
- `switchMode(mode)` - Toggle between login and register views
- `registerUser()` - Handle user registration with validation
- `loginUser()` - Authenticate user credentials
- `logoutUser()` - Clear login session
- `getPasswordStrength(password)` - Calculate password strength
- `getPasswordColor(password)` - Determine strength indicator color
- `getPasswordStrengthClass(password)` - Apply CSS classes based on strength
- `getPasswordStrengthText(password)` - Display strength level text

### Data Model
```javascript
$scope.user = {
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    password: '',
    confirmPassword: ''
};

$scope.credentials = {
    username: '',
    password: ''
};
```

## Validation Rules

| Field | Rules |
|-------|-------|
| First Name | Required, alphabetic characters only |
| Last Name | Required, alphabetic characters only |
| Username | Required, 4-12 characters, unique |
| Email | Required, valid email format |
| Password | Required, minimum 6 characters |
| Confirm Password | Must match password field |

## Password Strength Calculation
- Length 6+ characters: +20%
- Length 8+ characters: +10%
- Length 12+ characters: +10%
- Lowercase letters: +15%
- Uppercase letters: +15%
- Numbers: +15%
- Special characters: +15%
- **Maximum: 100%**

## AngularJS Concepts Demonstrated

### 1. MVC Architecture
- **Model**: User and credentials objects
- **View**: HTML templates with directives
- **Controller**: AuthController managing all business logic

### 2. Two-Way Data Binding
```html
<input ng-model="user.firstName">
<p>{{user.firstName}}</p>
```
Changes in input automatically reflect in the paragraph and vice versa.

### 3. Form Validation
```html
<form name="loginForm" ng-submit="loginUser()" novalidate>
    <input required ng-model="credentials.username">
    <span ng-show="loginForm.username.$error.required">Required</span>
</form>
```

### 4. Event Handling
```html
<button ng-click="switchMode('register')">Register</button>
<form ng-submit="registerUser()">...</form>
```

### 5. Conditional Rendering
```html
<div ng-show="currentMode === 'login'">Login Form</div>
<div ng-show="currentMode === 'register'">Registration Form</div>
```

## Browser Compatibility
- Chrome (recommended)
- Firefox
- Safari
- Edge
- Internet Explorer 10+

## Notes for Students
1. This is a **client-side only** implementation for demonstration purposes
2. For production use, integrate with a backend server (Node.js, PHP, Java, etc.)
3. Never store passwords in plain text in localStorage (encrypt before storing)
4. Implement server-side validation in addition to client-side validation
5. Use HTTPS for secure data transmission
6. Consider adding features like:
   - Email verification
   - Password reset functionality
   - Two-factor authentication
   - User profile management
   - Account recovery

## Learning Outcomes
After completing this practical, students should understand:
- AngularJS framework architecture and concepts
- Two-way data binding and its advantages
- Form validation techniques
- Controller development and scope management
- AngularJS directives and their usage
- Event handling in AngularJS
- Client-side authentication simulation
- Responsive web design principles

## References
- [AngularJS Official Documentation](https://angularjs.org/)
- [AngularJS Developer Guide](https://docs.angularjs.org/guide)
- [Form Validation in AngularJS](https://docs.angularjs.org/guide/forms)
- [Savitribai Phule Pune University Web Technology Curriculum](https://www.unipune.ac.in/)

---

**Subject**: Web Technology (WT)  
**Class**: Third Year Computer Engineering  
**University**: Savitribai Phule Pune University  
**Date**: April 2026
