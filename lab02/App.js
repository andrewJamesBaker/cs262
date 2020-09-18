import { StatusBar } from 'expo-status-bar';
import React, {useState} from 'react';
import { StyleSheet, Text, View, Button, TextInput, FlatList } from 'react-native';

export default function App() {
  const [name, setName] = useState('e.g. John Doe');
  const [count, setCount] = useState(0);
  const [birthdays, setBirthdays] =useState([]);



  const clickerHandler = () => {
    setCount(count + 1);

    setBirthdays(
      birthdays.concat({key: (count + 1).toString()})
  );
  }

  return (
    <View style={styles.container}>
      <Text>Enter name:</Text>
      <Text> </Text>
      <TextInput
        style={styles.input}
        placeholder='e.g. John Doe'
        onChangeText={(val) => setName(val)} />
      <Text> </Text>
      <Text>{name} is {count} years old.</Text>
      <Text> </Text>
      <View style={styles.buttonContainer}>
        <Button title='Birthday' onPress={clickerHandler}/>

        <FlatList
        numColumns={1}
        keyExtractor={(item) => item.age}
          data={birthdays}
          renderItem={({item}) => (
            <Text>{item.key}</Text>
          )} />
        </View>
      
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
