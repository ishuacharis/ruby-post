
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "button"]

  initialize() {
    console.log("sessions controller")
    
    this.emailField =  this.formTarget.querySelector("#user_email")
    this.passwordField =  this.formTarget.querySelector("#user_password_hash")
    this.passwordField.disabled = true;
    this.buttonTarget.disabled = true;
  }

  connect() {
   console.log("sessions controller connected")
   this.isSubmitting = false;

   console.log(this.emailField)

  // document.querySelector("#user_email").addEventListener('blur' , function(e) {
  //   if(e.target.value.trim()) {
  //     document.querySelector("#user_password_hash").disabled = false;
  //   } else{
  //     document.querySelector("#user_password_hash").disabled = true
  //   }
  // })


  // document.querySelector("#user_password_hash").addEventListener('blur' , function(e) {
  //   if(e.target.value.trim()) {
  //     console.log(this.buttonTarget)
  //   } else{
  //     this.buttonTarget.disabled = true;
  //   }
  // })

 
   
  }


  beforeSubmit(e) {
    this.isSubmitting = true;
    this.buttonTarget.disabled = this.isSubmitting;
    let isValid =  this.validateForm(this.formTarget)
    
    
    if(!isValid) {
      console.log(isValid)
      this.isSubmitting = false;
      this.buttonTarget.disabled = this.isSubmitting;
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