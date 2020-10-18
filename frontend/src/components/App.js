import React from 'react'
import { Form } from './Form'
import { Carousel } from 'react-materialize'

export const App = () => {
    return (
        <div style={{ display: 'flex', flexDirection: 'column', justifyContent: 'center', alignItems: 'center', padding: "50px" }}>
            <Carousel
                carouselId="Carousel-2"
                images={[
                    'https://bit.ly/347FNjX',
                    'https://bit.ly/3kaBjik',
                    'https://bit.ly/3je5jZ7',
                    'https://bit.ly/352WT1G',
                    'https://bit.ly/2TbHV3T'
                ]}
                options={{
                    dist: 100,
                    duration: 200,
                    fullWidth: false,
                    indicators: true,
                    noWrap: false,
                    numVisible: 3,
                    onCycleTo: null,
                    padding: 0,
                    shift: 0
                }}
            />
            <Form />
        </div>
    )
}