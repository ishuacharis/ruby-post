console.log("session controller")

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "content"]

  initialize() {
    this.counter = 2000
  }
  beforeSubmit(e) {
    e.preventDefault()
    console.log(e)
  }

  connect() {
    
  }
  
  
}