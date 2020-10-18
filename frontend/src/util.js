import { useState, useEffect, useRef } from "react";

export const handleForm = ({
    initialValues,
    onSubmit
}) => {
    const [values, setValues] = useState(initialValues || {});
    const [errors, setErrors] = useState({});

    const formRendered = useRef(true);

    useEffect(() => {
        if (formRendered.current) {
            setValues(initialValues);
            setErrors({});
        }
        formRendered.current = false;
    }, [initialValues]);

    const handleChange = (event) => {
        const { target } = event;
        const { name, value } = target;

        event.persist();
        setValues({ ...values, [name]: value });
    };

    const handleSubmit = (event) => {
        if (event) event.preventDefault();

        const validatedFields = validateFields(values)
        if (validatedFields === true) {
            onSubmit(values, { errors });
            setValues({
                quantity: "1",
                first_name: "",
                last_name: "",
                street_1: "",
                street_2: "",
                city: "",
                state: "",
                zip: "",
                email: "",
                phone: "",
                cc_num: "",
                exp: "",
            })
        } else {
            setErrors(validatedFields)
        }
    };

    return {
        values,
        errors,
        handleChange,
        handleSubmit
    };
};

export const validateFields = (fields) => {
    const invalidFields = {}
    for (let field in fields) {
        if (fields[field] === "".replace(/\s/g, '')) {
            invalidFields[field] = "empty"
        }
    }

    return JSON.stringify(invalidFields) === '{}' ? true : invalidFields
}