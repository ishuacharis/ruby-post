// https://stimulusjs.org/handbook/introduction

import { Controller } from 'stimulus'

export default class extends Controller {

  static targets = ["name"];

  initialize() {
    console.log("initialize")
  }

  connect() {
    console.log("connect")
    //this.nameTarget.value = "hello"
  }

  disconnect() {
    console.log("disconnected")
  }

}
