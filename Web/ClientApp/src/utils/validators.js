// eslint-disable-next-line no-useless-escape
const emailRegex = new RegExp('^(([^<>()\\[\\]\\\\.,;:\\s@"]+(\\.[^<>()\[\]\\\\.,;:\\s@"]+)*)|(".+"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$');

export function loginFormValidator(values) {
    let result = {};

    if (!values.email) {
        result.email = 'Email address is required';
    } else if (!emailRegex.test(values.email)) {
        result.email = 'Email address is invalid';
    }

    if (!values.password) {
        result.password = 'Password is required';
    }

    return result;
}

export function registrationFormValidator(values) {
    let result = {};

    if (!values.email) {
        result.email = 'Email address is required';
    } else if (!emailRegex.test(values.email)) {
        result.email = 'Email address is invalid';
    }

    if (!values.password) {
        result.password = 'Password is required';
    } else if (values.password.length < 6) {
        result.password = 'Password must be at least 6 symbols long';
    } else if (values.password !== values.passwordConfirmation) {
        result.passwordConfirmation = 'Password confirmation is not the same';
    }

    return result;
}