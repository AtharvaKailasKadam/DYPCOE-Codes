function validateForm() {

    let userId = document.getElementById("userId").value.trim();
    let password = document.getElementById("password").value.trim();
    let name = document.getElementById("name").value.trim();
    let country = document.getElementById("country").value;
    let pincode = document.getElementById("pincode").value;
    let email = document.getElementById("email").value;

    let gender = document.querySelector('input[name="gender"]:checked');
    let languages = document.querySelectorAll('input[name="language"]:checked');

    if (userId.length < 5) {
        alert("User ID must be at least 5 characters");
        return false;
    }

    let passwordPattern = /^(?=.*\d).{6,}$/;
    if (!passwordPattern.test(password)) {
        alert("Password must be at least 6 characters and contain a number");
        return false;
    }

    let namePattern = /^[A-Za-z ]+$/;
    if (!namePattern.test(name)) {
        alert("Name should contain only letters");
        return false;
    }

    if (country === "") {
        alert("Please select a country");
        return false;
    }

    let pinPattern = /^[0-9]{6}$/;
    if (pincode === "" || !pinPattern.test(pincode)) {
        alert("Pincode must be 6 digits");
        return false;
    }

    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!emailPattern.test(email)) {
        alert("Enter valid email");
        return false;
    }

    if (!gender) {
        alert("Please select gender");
        return false;
    }

    if (languages.length === 0) {
        alert("Select at least one language");
        return false;
    }

    alert("Form submitted successfully ✅");
    return true;
}