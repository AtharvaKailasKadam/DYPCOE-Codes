var app = angular.module('authApp', []);

app.controller('AuthController', function($scope) {
    
    $scope.currentMode = 'login';
    $scope.registeredUsers = [];
    $scope.loggedInUser = null;
    $scope.loginErrorMessage = '';
    $scope.loginSuccessMessage = '';
    $scope.registerErrorMessage = '';
    $scope.registerSuccessMessage = '';
    $scope.usernameExists = false;
    
    $scope.credentials = {
        username: '',
        password: ''
    };
    
    $scope.user = {
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        password: '',
        confirmPassword: ''
    };
    
    $scope.switchMode = function(mode) {
        $scope.currentMode = mode;
        $scope.clearMessages();
        
        if(mode === 'login') {
            $scope.resetLoginForm();
        } else {
            $scope.resetRegisterForm();
        }
    };
    
    $scope.registerUser = function() {
        if($scope.user.password !== $scope.user.confirmPassword) {
            $scope.registerErrorMessage = 'Passwords do not match!';
            return;
        }
        
        var userExists = $scope.registeredUsers.some(function(u) {
            return u.username.toLowerCase() === $scope.user.username.toLowerCase();
        });
        
        if(userExists) {
            $scope.registerErrorMessage = 'Username already exists. Please choose another.';
            $scope.usernameExists = true;
            return;
        }
        
        var newUser = {
            firstName: $scope.user.firstName,
            lastName: $scope.user.lastName,
            username: $scope.user.username,
            email: $scope.user.email,
            password: $scope.user.password
        };
        
        $scope.registeredUsers.push(newUser);
        
        $scope.registerSuccessMessage = 'Registration successful! Welcome, ' + $scope.user.firstName + '!';
        $scope.registerErrorMessage = '';
        $scope.usernameExists = false;
        
        $scope.resetRegisterForm();
        
        setTimeout(function() {
            $scope.$apply(function() {
                $scope.switchMode('login');
            });
        }, 2000);
    };
    
    $scope.loginUser = function() {
        var username = $scope.credentials.username;
        var password = $scope.credentials.password;
        
        var user = $scope.registeredUsers.find(function(u) {
            return (u.username.toLowerCase() === username.toLowerCase() || 
                    u.email.toLowerCase() === username.toLowerCase()) &&
                   u.password === password;
        });
        
        if(user) {
            $scope.loggedInUser = user.firstName + ' ' + user.lastName;
            $scope.loginSuccessMessage = 'Login successful!';
            $scope.loginErrorMessage = '';
            
            localStorage.setItem('loggedInUser', $scope.loggedInUser);
            localStorage.setItem('currentUsername', user.username);
        } else {
            if(username === '' || password === '') {
                $scope.loginErrorMessage = 'Please enter both username and password.';
            } else {
                $scope.loginErrorMessage = 'Invalid username or password. Please try again or register.';
            }
            $scope.loginSuccessMessage = '';
        }
    };
    
    $scope.logoutUser = function() {
        $scope.loggedInUser = null;
        $scope.credentials.username = '';
        $scope.credentials.password = '';
        $scope.loginSuccessMessage = '';
        $scope.loginErrorMessage = '';
        
        localStorage.removeItem('loggedInUser');
        localStorage.removeItem('currentUsername');
    };
    
    $scope.resetLoginForm = function() {
        if($scope.loginForm) {
            $scope.loginForm.$setPristine();
            $scope.loginForm.$setUntouched();
        }
        $scope.credentials.username = '';
        $scope.credentials.password = '';
    };
    
    $scope.resetRegisterForm = function() {
        if($scope.registerForm) {
            $scope.registerForm.$setPristine();
            $scope.registerForm.$setUntouched();
        }
        $scope.user.firstName = '';
        $scope.user.lastName = '';
        $scope.user.username = '';
        $scope.user.email = '';
        $scope.user.password = '';
        $scope.user.confirmPassword = '';
        $scope.usernameExists = false;
    };
    
    $scope.clearMessages = function() {
        $scope.loginErrorMessage = '';
        $scope.loginSuccessMessage = '';
        $scope.registerErrorMessage = '';
        $scope.registerSuccessMessage = '';
    };
    
    $scope.getPasswordStrength = function(pwd) {
        if(!pwd) return 0;
        
        var strength = 0;
        
        if(pwd.length >= 6) strength += 20;
        if(pwd.length >= 8) strength += 10;
        if(pwd.length >= 12) strength += 10;
        
        if(/[a-z]/.test(pwd)) strength += 15;
        if(/[A-Z]/.test(pwd)) strength += 15;
        if(/[0-9]/.test(pwd)) strength += 15;
        if(/[^a-zA-Z0-9]/.test(pwd)) strength += 15;
        
        return Math.min(strength, 100);
    };
    
    $scope.getPasswordColor = function(pwd) {
        var strength = $scope.getPasswordStrength(pwd);
        
        if(strength < 30) return '#e74c3c';
        if(strength < 60) return '#f39c12';
        if(strength < 80) return '#f1c40f';
        return '#27ae60';
    };
    
    $scope.getPasswordStrengthClass = function(pwd) {
        var strength = $scope.getPasswordStrength(pwd);
        
        if(strength < 30) return 'weak';
        if(strength < 60) return 'fair';
        if(strength < 80) return 'good';
        return 'strong';
    };
    
    $scope.getPasswordStrengthText = function(pwd) {
        var strength = $scope.getPasswordStrength(pwd);
        
        if(strength < 30) return 'Weak';
        if(strength < 60) return 'Fair';
        if(strength < 80) return 'Good';
        return 'Strong';
    };
    
    var savedUser = localStorage.getItem('loggedInUser');
    if(savedUser) {
        $scope.loggedInUser = savedUser;
    }
});
