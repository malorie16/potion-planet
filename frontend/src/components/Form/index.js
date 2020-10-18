import React, { useState } from 'react'
import { handleForm, validateFields } from '../../util.js'

const PRICE = 49.99

export const Form = () => {

    const initialValues = {
        total: PRICE,
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
    }

    const {
        values,
        errors,
        handleChange,
        handleSubmit
    } = handleForm({
        initialValues, onSubmit: values => {
            const BASE_URL = "https://potion-planet.herokuapp.com/magic"

            values.total = adjustedTotal

            const body = JSON.stringify({ transaction: values })

            fetch(BASE_URL, {
                method: "POST",
                headers: {
                    'Content-Type': 'application/json',
                },
                body: body
            })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        alert(data.error)
                    } else {
                        setAdjustedTotal("49.99")
                        alert("Thank you! Your order has been placed!");
                    }
                })
                .catch((error) => {
                    console.error('Error:', error);
                })
        }
    });

    const [adjustedTotal, setAdjustedTotal] = useState(values.total)

    const handleAdjustedTotal = (event) => {
        setAdjustedTotal(PRICE * parseInt(event.target.value))
        handleChange(event)
    }

    return (
        <>
            <div class="row">
                <form class="col s12" onSubmit={handleSubmit}>
                    <div class="row">
                        <div class="input-field col s6">
                            <input
                                disabled
                                id="total_amount"
                                type="text"
                                class="validate"
                                name="total"
                                // This should have stricter protection around whether this is a number
                                value={adjustedTotal}
                                placeholder={adjustedTotal}
                            />
                            <label htmlhtmlFor="text">Total amount</label>
                        </div>
                        <div class="input-field col s6">
                            <input
                                id="quantity"
                                type="number"
                                class={`validate ${errors[""] && 'invalid'}`}
                                max="3"
                                min="1"
                                name="quantity"
                                value={values.quantity}
                                onChange={handleAdjustedTotal}
                            />
                            <label htmlFor="number">Quantity</label>
                            <span class="helper-text" data-error="Please select a maximum of 3 and be sure you're entering a number!" />
                        </div>
                    </div >
                    <div class="row">
                        <div class="input-field col s6">
                            <input
                                id="first_name"
                                type="text"
                                class={`validate ${errors["first_name"] && 'invalid'}`}
                                value={values.first_name}
                                name="first_name"
                                onChange={handleChange}
                            />
                            <label htmlFor="first_name">First Name</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="last_name" type="text" class={`validate ${errors["last_name"] && 'invalid'}`} name="last_name" value={values.last_name} onChange={handleChange} />
                            <label htmlFor="last_name">Last Name</label>
                        </div>
                        <div class="input-field col s6">
                            <input
                                id="street1"
                                type="text"
                                class={`validate ${errors["street_1"] && 'invalid'}`}
                                name="street_1"
                                value={values.street_1}
                                onChange={handleChange}
                            />
                            <label htmlFor="street1">Address Line 1</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="street2" type="text" class={`validate ${errors["street_2"] && 'invalid'}`} name="street_2" value={values.street_2} onChange={handleChange} onChange={handleChange} />
                            <label htmlFor="street2">Address Line 2</label>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <input id="city" type="text" class={`validate ${errors["city"] && 'invalid'}`} name="city" value={values.city} onChange={handleChange} onChange={handleChange} />
                                <label htmlFor="city">City</label>
                            </div>
                            <div class="input-field col s4">
                                <input id="state" type="text" class={`validate ${errors["state"] && 'invalid'}`} value={values.state} onChange={handleChange} name="state" onChange={handleChange} />
                                <label htmlFor="state">State</label>
                            </div>
                            <div class="input-field col s4">
                                <input id="zip" type="text" class={`validate ${errors["zip"] && 'invalid'}`} name="zip" value={values.zip} onChange={handleChange} />
                                <label htmlFor="zip">Zip code</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="email" type="email" class={`validate ${errors["email"] && 'invalid'}`} name="email" value={values.email} onChange={handleChange} />
                            <label htmlFor="email">Email</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="tel" type="tel" name="phone" class={`validate ${errors["phone"] && 'invalid'}`} value={values.phone} onChange={handleChange} />
                            <label htmlFor="tel">Phone number</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                            <input id="cc" type="number" class={`validate ${errors["cc_num"] && 'invalid'}`} name="cc_num" value={values.cc_num} onChange={handleChange} />
                            <label htmlFor="cc">Credit card number</label>
                        </div>
                        <div class="input-field col s4">
                            <input id="exp" type="text" class={`validate ${errors["exp"] && 'invalid'}`} name="exp" value={values.exp} onChange={handleChange} />
                            <label htmlFor="exp">Expiration</label>
                        </div>
                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">
                        Submit
                    </button>
                </form>
            </div>
        </>
    )
}