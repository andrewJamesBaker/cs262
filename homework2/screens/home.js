import React, { useState, useEffect } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

export default function Home({ navigation }) {
    const [isLoading, setLoading] = useState(true);
    const [data, setData] = useState([]);

//takes the data from the monopoly database given by Prof. Vanderlinden

    useEffect(() => {
        fetch('https://cs262-monopoly-service.herokuapp.com/players/')
          .then((response) => response.json())
          .then((json) => setData(json))
          .catch((error) => console.error(error))
          .finally(() => setLoading(false));
      }, []);

    return (
        <View style={globalStyles.container}>
            <FlatList data={data}
            keyExtractor={({ id }, index) => id}
            renderItem={({ item }) => (
                // takes in the database info and sends some of it into the app through an array that the review details can read.
                <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', {id: item.id, email:item.email, name:item.name})}>
                    <Card>
                        {/* displays the email from the data base */}
                        <Text style={globalStyles.titleText}>{ item.email }</Text>
                    </Card>
                </TouchableOpacity>
            )} />
        </View>
    );
}
