console.log("session controller")

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "content"]

  initialize() {
 
  }
  beforeSubmit(e) {
    let isValid =  this.validateForm(this.formTarget)

    if(!isValid) {
      e.preventDefault()
    }
  }

  connect() {
    
  }

  validateForm(form) {
    let isValid =  true;
    let requiredFieldSelectors =  'input[type="email"]:required, input[type="password_hash"]:required';
    let requiredFields  = form.querySelectorAll(requiredFieldSelectors);
    requiredFields.forEach((field) => {
      if(!field.disabled && !field.value.trim()){
        field.focus();
        isValid = false;
        //return false;
      }
    })

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

    return false
  }
  
  
}