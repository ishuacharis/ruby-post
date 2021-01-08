
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "content"]

  initialize() {
    console.log("sessions controller")
 
  }

  connect() {
    console.log("sessions controller connected")
  }

  beforeSubmit(e) {
    let isValid =  this.validateForm(this.formTarget)
    
    
    if(!isValid) {
      console.log(isValid)
      e.preventDefault()
    }
  }

  validateForm(form) {
    let isValid =  true;
    let emailField = form.querySelector('input[name="user[email]"]')
    let passwordField = form.querySelector('input[name="user[email]"]')

    if(!emailField.disabled && !emailField.value.trim()) {
      emailField.focus();
      isValid = false;
    } else if(!passwordField.disabled && !passwordField.value.trim()){
      passwordField.focus();
      isValid = false;
    }
    //let requiredFieldSelectors = 'input[type="email"]:required, input[type="password"]:required';
    //let requiredFields  = form.querySelectorAll(requiredFieldSelectors);
    // requiredFields.forEach((field) => {
    //   console.log(field)
    //   if(!field.disabled && !field.value.trim()){
    //     field.focus();
    //     isValid = false;
    //     //return false;
    //   }
    // })

    // if(!isValid) {
    //   return false;
    // }

    // let invalidFields  = form.querySelectorAll('input:invalid')

    // invalidFields.forEach((field) => {
      
    //   if(!field.disabled){
    //     field.focus();
    //     isValid = false;
    //   }

    // })

    return isValid
  }
  
  
}