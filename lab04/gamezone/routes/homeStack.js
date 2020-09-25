import React from 'react';
import {createStackNavigator} from '@react-navigation/stack';
// import { createAppContainer } from 'react-navigation';

import Home from '../screens/home';
import ReviewDetails from '../screens/reviewDetails';

const Stack = createStackNavigator();
export default function HomeStack() {
    return (
        <Stack.Navigator screenOptions={{headerStyle:{backgroundColor:'#ddd'}}}>
            <Stack.Screen
                name="Home"
                component={Home}
                options={{title: 'GameZone', headerStyle: { backgroundColor: '#555'}}}
            />
            <Stack.Screen
                name="ReviewDetails"
                component={ReviewDetails}
                options={{title: 'ReviewDetails', headerStyle: { backgroundColor: '#555'}}}
            />
        </Stack.Navigator>
    );
};
