import { Controller } from 'stimulus'

export default class extends Controller {
    static targets  = ['form']



    beforeSubmit(e) {
        let isValid = this.validateForm(this.formTarget);

        if(!isValid) {
            e.preventDefault()
        }
    }

    validateForm(form) {

        let isValid = true;

        let requiredFieldSelectors  = 'input[type="text"], input[type="email"], input[type="password_hash"]';
        let requiredFields  = form.querySelectorAll(requiredFieldSelectors);

        requiredFields.forEach((field) => {
            if(!field.disabled && !field.value.trim()) {
                field.focus();
                isValid = false;
            }
        });

        return isValid;
    }


    connect() {

    }
}