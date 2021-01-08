import { Controller } from 'stimulus'

export default class extends Controller {
    static targets  = ['form']

    initialize() {
        console.log("users controller initialized")
    }
    connect() {
        console.log("users controller connected")
    }

    beforeSubmit(e) {
        
        let isValid = this.validateForm(this.formTarget);
        
        if(!isValid) {
            console.log(isValid)
            e.preventDefault()
        }
        
    }

    validateForm(form) {
        let isValid = true;
        let usernameField = form.querySelector('input[name="user[username]"]') ;
        let emailField = form.querySelector('input[name="user[email]"]');
        let passwordField = form.querySelector('input[name="user[password_hash]"]');

        if(!usernameField.disabled && !usernameField.value.trim()){
            console.log("here")
            usernameField.focus();
            isValid = false;
        }
        else if(!emailField.disabled && !emailField.value.trim()){
            emailField.focus();
            isValid = false;
        }
        else if(!passwordField.disabled && !passwordField.value.trim()){
            passwordField.focus();
            isValid = false;
        }

        return isValid;
    }

}